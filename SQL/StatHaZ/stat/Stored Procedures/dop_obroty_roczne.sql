CREATE PROCEDURE [stat].dop_obroty_roczne
  @p_rok smallint
as
  declare @v_info varchar (1000)
  set @v_info = 'start: - obliczenie dop_obroty_roczne - rok: ' + convert (varchar, @p_rok)
  exec stat.DziennikWpisInfo @v_info, @@PROCID;
  --

  --
  -- Usunięcie poprzednio obliczonych obrotów
  delete from stat.dot_obroty_roczne where rok = @p_rok and nip <> '0000000000'
  --

  --
  -- Zsumowanie obrotów z rdin'a
  --
  exec stat.DziennikWpisInfo 'start: dop_obroty_roczne - przygotowanie danych z rdin'
  TRUNCATE TABLE tmp.[dot_sum_rdin_nip];
  INSERT INTO tmp.[dot_sum_rdin_nip]
  select nip,
         rok,
         sr_mies_stat_przywoz,
         sr_mies_stat_wywoz,
         roczny_stat_przywoz,
         roczny_stat_wywoz
  from (
    select [NIP]      nip,
           Rok      rok,
           0        sr_mies_stat_przywoz,
           0        sr_mies_stat_wywoz,
           sum (isnull(trans_nabycie, 0)) roczny_stat_przywoz,
           0 roczny_stat_wywoz
     from stat.dgv_kopia_intr_rdin r
     where Rok = @p_rok
       and status_us <> 'A'
       and not exists (select 1 
                         from tmp.dot_sum_dekl_nip n 
                        where n.nip = r.[NIP] 
                          and n.RokMc = r.RokMc 
                          and n.typ = 'P' )
    group by [NIP], rok
  union all
    select [NIP]      nip,
           rok      rok,
           0        sr_mies_stat_przywoz,
           0        sr_mies_stat_wywoz,
           0        roczny_stat_przywoz,
           sum (isnull(trans_dostawa, 0)) roczny_stat_wywoz
     from stat.dgv_kopia_intr_rdin r
     where rok = @p_rok
       and status_us <> 'A'
       and not exists (select 1 
                         from tmp.dot_sum_dekl_nip n 
                        where n.nip = r.[NIP] 
                          and n.RokMc = r.RokMc 
                          and n.typ = 'W' )
    group by [NIP], rok) as obr
  --
  -- Wstawienie danych do dot_obroty_roczne
  --
  exec stat.DziennikWpisInfo 'start: dop_obroty_roczne - wstawienie do dot_obroty_roczne';

  with p as (select count(*) il, nip, RokMc/100 as rok from tmp.dot_sum_dekl_nip where typ = 'P' group by nip, RokMc/100),
	   w as (select count(*) il, nip, RokMc/100 as rok from tmp.dot_sum_dekl_nip where typ = 'W' group by nip, RokMc/100)

  insert into dot_obroty_roczne
  (nip, rok, sr_mies_stat_przywoz, sr_mies_stat_wywoz, roczny_stat_przywoz, roczny_stat_wywoz)
  select obr.nip, 
         obr.rok, 
         convert(numeric(15),sum(obr.sr_mies_stat_przywoz)), 
         convert(numeric(15),sum(obr.sr_mies_stat_wywoz)), 
         convert(numeric(15),sum(obr.roczny_stat_przywoz)), 
         convert(numeric(15),sum(obr.roczny_stat_wywoz))
    from (select d.nip nip,
                 d.RokMc/100 rok,
                 isnull(round(sum(case d.typ when 'P' then d.wartosc_stat else 0 end)/max(p.il),0),0) sr_mies_stat_przywoz,
                 isnull(round(sum(case d.typ when 'W' then d.wartosc_stat else 0 end)/max(w.il),0),0) sr_mies_stat_wywoz,
                 sum(case d.typ when 'P' then d.wartosc else 0 end) roczny_stat_przywoz,
                 sum(case d.typ when 'W' then d.wartosc else 0 end) roczny_stat_wywoz
            from tmp.dot_sum_dekl_nip d
			left join p on p.rok = d.RokMc/100 and p.nip = d.nip 
            left join w on w.rok = d.RokMc/100 and w.nip = d.nip 
            where d.RokMc/100 = @p_rok
           group by d.nip, d.RokMc/100
            union all
            select 
              r.nip nip,
              r.rok rok,
              0 sr_mies_stat_przywoz,
              0 sr_mies_stat_wywoz,
              sum(isnull(r.roczny_stat_przywoz,0)) roczny_stat_przywoz,
              sum(isnull(r.roczny_stat_wywoz,0))   roczny_stat_wywoz
            from tmp.dot_sum_rdin_nip r
            where r.rok = @p_rok
            group by r.nip, r.rok) as obr
    group by obr.nip, obr.rok
	-- uzupełnienie danymi za rok poprzedni jeśli obroty są liczone za rok bieżący
	if @p_rok=year(getdate()) begin
	insert into dot_obroty_roczne
	   select nip,
	          @p_rok,
						sr_mies_stat_przywoz,
						sr_mies_stat_wywoz,
						roczny_stat_przywoz,
						roczny_stat_wywoz
	      from stat.dot_obroty_roczne old 
	    where rok = @p_rok - 1 
	      and nip  <> '0000000000'
	      and not exists (select 1 
	                        from stat.dot_obroty_roczne new 
	                       where new.nip = old.nip and new.rok = @p_rok)
end

  -- czyszczenie tabeli tymczasowej
  truncate table tmp.dot_sum_rdin_nip;
  exec stat.DziennikWpisInfo 'stop: dop_obroty_roczne', @@PROCID;