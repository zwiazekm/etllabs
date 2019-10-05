-- =============================================
-- Autor:		    ?
-- Autor modyf      Krzysztof Nagły
-- Data utworzenia: ?
-- Data modyf       18.06.2014
-- Opis:            Procedura wyliczająca: priorytety, kategorie i okresy sprawozdawcze.
--                  Modyfikacja zamiana widoków na tabele w okresach sprawozdawczych.
-- =============================================
CREATE PROCEDURE [stat].dop_wyznaczenie_kategorii_priorytetow_okresow
  @p_data_od date,
  @p_data_do date
as
begin
  declare @v_info varchar (1000);
  declare @v_year smallint;

  set @v_info = 'Start: @p_data_od: ' + convert (varchar, @p_data_od, 120) + ', @p_data_do: ' + convert (varchar, @p_data_do, 120);
  exec [stat].DziennikWpisInfo @v_info, @@PROCID;;
  --
  declare @v_data_pom date;
  declare @v_typ      char (1);
  declare @v_pom      int;
  declare @RokMc      int;
  --
  select @v_pom = 1;
  -- przygotowanie tabeli pomocniczej
  exec stat.DziennikWpisInfo 'start: tworzenie tabeli pomocniczej', @@PROCID;
  --

  TRUNCATE TABLE [tmp].[dot_sum_dekl_nip];

  INSERT INTO [tmp].[dot_sum_dekl_nip] (nip, RokMc, typ, wartosc, wartosc_stat)
  select dwd.nip_zobowiazanego     nip,
         dwd.RokMc,
         dwd.typ                   typ,
         sum (isnull (dwp.wartosc_faktury, dwp.wartosc_stat)) wartosc,
         sum (isnull (dwp.wartosc_stat, dwp.wartosc_faktury )) wartosc_stat
   from stat.dgv_kopia_istat_dekl_wynik_dok as dwd,
        stat.dgv_kopia_istat_dekl_wynik_poz as dwp
   where dwd.id_dok = dwp.id_dok
     and dwd.[Status] != 'U'
     and dwp.[Status] = 'Y'
  group by dwd.nip_zobowiazanego, dwd.RokMc, dwd.typ;
	--
		insert into [tmp].[dot_sum_dekl_nip] (nip, RokMc, typ, wartosc, wartosc_stat)
		 select dwd.nip_zobowiazanego     nip,
		         RokMc,
		         dwd.typ                   typ,
		         0 wartosc,
		         0 wartosc_stat
		   from stat.dgv_kopia_istat_dekl_wynik_dok dwd    
		   where not exists (select 1 
		                       from stat.dgv_kopia_istat_dekl_wynik_poz pwd
		                      where pwd.id_dok = dwd.id_dok)
         and not exists (select 1 from [tmp].[dot_sum_dekl_nip] o
                          where o.nip = dwd.nip_zobowiazanego
                            and o.typ = dwd.typ
                            and o.RokMc = dwd.RokMc)
		     and dwd.[Status] != 'U'
		  group by dwd.nip_zobowiazanego, dwd.RokMc, dwd.typ;
  --
  --create index idx_dot_sum_dekl_nip_tmp on [stat].[dot_sum_dekl_nip_tmp] (nip, miesiac, rok, typ); --

  -- Obliczenie dot obrotów rocznych za rok poprzedni
  set @v_year = year(@p_data_do) - 1;
  exec [stat].dop_obroty_roczne @v_year;

  -- Obliczenie dot obrotów rocznych za rok bieżący
  set @v_year = year(@p_data_do);
  exec [stat].dop_obroty_roczne @v_year;
  --
  exec stat.DziennikWpisInfo 'start: - obroty roczne obliczone', @@PROCID;
  --


  -- Aktualizacja danych na podstawie rdin'a
  insert into [tmp].[dot_sum_dekl_nip] (nip, RokMc, typ, wartosc, wartosc_stat)
   (select r.[NIP] nip,
           RokMc,
           'P',
           sum (isnull(trans_nabycie,0)) wartosc,
           0
      from stat.dgv_kopia_intr_rdin r
     where r.status_us != 'A'
       and not exists (select 1
                         from [tmp].[dot_sum_dekl_nip] dwd
                        where dwd.typ = 'P'
                          and dwd.RokMc = r.RokMc
                          and dwd.nip = r.[NIP])
     group by [NIP], RokMc
  union all
    select r.[NIP] nip,
           RokMc,
           'W',
           sum (isnull(trans_dostawa,0)) wartosc,
           0
      from stat.dgv_kopia_intr_rdin r
     where r.status_us != 'A'
       and not exists (select 1
                         from [tmp].[dot_sum_dekl_nip] dwd
                        where dwd.typ = 'W'
                          and dwd.RokMc = r.RokMc
                          and dwd.nip = r.[NIP])
     group by [NIP], RokMc
		);
  --
  exec stat.DziennikWpisInfo 'start: - uzupełnienie tabeli pomocniczej', @@PROCID;
  --
  -- w petli dla przywozu i wywozu
  while @v_pom <= 2
  begin
    if @v_pom = 1
      select @v_typ = 'P';
    else
      select @v_typ = 'W';
    --
    set @v_data_pom = @p_data_od;
    --
    -- kazdorazowe wyliczenie kategorii i priorytetow jest robione od poczatku w zwiazku z czym wymaga wyczyszenia starych danych
    delete from stat.dot_priorytet where rodzaj_prior = @v_typ;
    delete from stat.dot_kategoria where rodz_kat = @v_typ;
    --
    -- priorytety
    exec stat.DziennikWpisInfo 'start: - priorytety', @@PROCID;
    --
    -- ustawienie priorytytetow na podstawie danych ubieglorocznych
    print 'insert into dot_priorytet';
    insert into stat.dot_priorytet
	  ([id_pod],[nr_poz],[rodzaj_prior],[priorytet],[wazna_od_mies],[wazna_od_rok],[wazna_do_mies],[wazna_do_rok],[w_systemie_od])
      select dp.id_pod          id_pod,
             null               nr_poz,
             @v_typ             rodzaj_prior,
             iprio.symbol       priorytet,
             1                  wazna_od_mies,
             year (@p_data_od)  wazna_od_rok,
             null               wazna_do_mies,
             null               wazna_do_rok,
             getdate ()         w_systemie_od
        from stat.dot_obroty_roczne obr,
             dgv_kopia_intr_dane_pod dp,
             dgv_kopia_slowniki iprio
       where obr.nip = dp.nip
         and obr.rok = year (@p_data_od) - 1
         and id_rodz_slow = case when @v_typ = 'P' then 'ipriop' else 'ipriow' end
         and @p_data_od between iprio.data_od and iprio.data_do
         and convert (bigint, case when @v_typ = 'P' then obr.roczny_stat_przywoz else obr.roczny_stat_wywoz end) between convert (bigint, iprio.kwota) and convert (bigint, iprio.kwota2) - .01;
    --
    -- zamkniecie ostatniego otwartego okresu i ustawienie priorytetow na podstawie obrotow
    -- zrealizowanych w okresie narastajacym (styczen - miesiac sprawozdawczy) roku biezacego
    while @v_data_pom < @p_data_do
    begin
      -- ... zamkniecie ostatniego otwartego okresu
      print convert (varchar, @v_data_pom, 112)
      print 'update dot_priorytet'
	  set @RokMc = dbo.KonwertujDateNaRokMc(@v_data_pom);
      update stat.dot_priorytet
         set priorytet = case when month (@v_data_pom) = 1 then iprio.symbol else priorytet end,
             wazna_do_mies = case when month (@v_data_pom) = 1 then null else month (@v_data_pom) - 1 end,
             wazna_do_rok = case when month (@v_data_pom) = 1 then null else year (@v_data_pom) end
        from (select nip,
                     sum(wartosc) wartosc
                from [tmp].[dot_sum_dekl_nip]
               where typ = @v_typ
				 and RokMc between year(@v_data_pom)*100+1 and year(@v_data_pom)*100+month(@v_data_pom)
                 group by nip
              ) obr,
             stat.dgv_kopia_intr_dane_pod dp,
             stat.dgv_kopia_slowniki iprio,
             stat.dot_priorytet p
       where obr.nip = dp.nip
         and iprio.id_rodz_slow = case when @v_typ = 'P' then 'ipriop' else 'ipriow' end
         and @v_data_pom between iprio.data_od and iprio.data_do
         and convert (bigint, obr.wartosc) between convert (bigint, iprio.kwota) and convert (bigint, iprio.kwota2) - 0.01
         and convert (bigint, obr.wartosc) != 0
         and dp.id_pod = p.id_pod
         and p.rodzaj_prior = @v_typ
		 and @RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
         and p.priorytet < iprio.symbol
         and p.wazna_do_mies is null;
      -- ... ustawienie priorytetow na podstawie obrotow zrealizowanych w okresie narastajacym
      --     (styczen - miesiac sprawozdawczy) roku biezacego o ile priorytet idzie w gore

    print 'insert into dot_priorytet';
    insert into stat.dot_priorytet
	  ([id_pod],[nr_poz],[rodzaj_prior],[priorytet],[wazna_od_mies],[wazna_od_rok],[wazna_do_mies],[wazna_do_rok],[w_systemie_od])
      select dp.id_pod           id_pod,
             null                nr_poz,
             @v_typ              rodzaj_prior,
             iprio.symbol        priorytet,
             month (@v_data_pom) wazna_od_mies,
             year (@v_data_pom)  wazna_od_rok,
             null                wazna_do_mies,
             null                wazna_do_rok,
             getdate ()          w_systemie_od
        from (select nip,
                     sum(wartosc) wartosc
                from tmp.[dot_sum_dekl_nip]
               where typ = @v_typ
				 and RokMc between dbo.KonwertujMiRNaRokMc(1, year(@v_data_pom)) and dbo.KonwertujDateNaRokMc(@v_data_pom)
                 group by nip
              ) obr,
             stat.dgv_kopia_intr_dane_pod dp,
             stat.dgv_kopia_slowniki iprio
       where obr.nip = dp.nip
         and iprio.id_rodz_slow = case when @v_typ = 'P' then 'ipriop' else 'ipriow' end
         and @v_data_pom between iprio.data_od and iprio.data_do
         and convert (bigint, obr.wartosc) between convert (bigint, iprio.kwota) and convert (bigint, iprio.kwota2) - .01
         and convert (bigint, obr.wartosc) != 0
         and (    exists (select 1
                            from stat.dot_priorytet p
                           where p.id_pod = dp.id_pod
                             and p.rodzaj_prior = @v_typ
							 and @RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
                             and p.priorytet < iprio.symbol)
               or not exists (select 1
                                from stat.dot_priorytet p
                               where p.id_pod = dp.id_pod
                                 and p.rodzaj_prior = @v_typ
								 and @RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc )
             );
      --
      -- skok do kolejnego miesiaca
      set @v_data_pom = dateadd (month, 1, @v_data_pom);
    end;
    --
    -- kategorie
    exec stat.DziennikWpisInfo 'start: - kategorie', @@PROCID;
    --
    select @v_data_pom = @p_data_od;
    --
    -- ustawienie kategorii na podstawie danych ubieglorocznych
    print 'insert into dot_kategoria';
    insert into stat.dot_kategoria
      select dp.id_pod          id_pod,
             null               nr_poz,
             @v_typ             rodz_kat,
             ikap.symbol        kategoria,
             null               zakres_szczeg,
             1                  wazna_od_mies,
             year (@p_data_od)  wazna_od_rok,
             null               wazna_do_mies,
             null               wazna_do_rok,
             getdate ()         w_systemie_od
        from stat.dot_obroty_roczne obr,
             stat.dgv_kopia_intr_dane_pod dp,
             stat.dgv_kopia_slowniki ikap
       where obr.nip = dp.nip
         and obr.rok = year (@p_data_od) - 1
         and id_rodz_slow = case when @v_typ = 'P' then 'ikapp' else 'ikapw' end
         and @p_data_od between ikap.data_od and ikap.data_do
         and convert (bigint, case when @v_typ = 'P' then obr.roczny_stat_przywoz else obr.roczny_stat_wywoz end) between convert (bigint, ikap.kwota) and convert (bigint, ikap.kwota2) - .01;
    --
    -- zamkniecie ostatniego otwartego okresu i ustawienie kategorii na podstawie obrotow
    -- zrealizowanych w okresie narastajacym (styczen - miesiac sprawozdawczy) roku biezacego
    while @v_data_pom < @p_data_do
    begin
      -- ... zamkniecie ostatniego otwartego okresu
      print convert (varchar, @v_data_pom, 112);
      print 'update dot_kategoria';
      update stat.dot_kategoria
         set kategoria = case when month (@v_data_pom) = 1 then ikap.symbol else kategoria end,
             wazna_do_mies = case when month (@v_data_pom) = 1 then null else month (@v_data_pom) - 1 end,
             wazna_do_rok = case when month (@v_data_pom) = 1 then null else year (@v_data_pom) end
        from (select nip,
                     sum(wartosc) wartosc
                from tmp.[dot_sum_dekl_nip]
               where typ = @v_typ
				 and RokMc BETWEEN dbo.KonwertujMiRNaRokMc(1, year(@v_data_pom)) AND dbo.KonwertujMiRNaRokMc(month(@v_data_pom), year(@v_data_pom))
                 group by nip
              ) obr,
             stat.dgv_kopia_intr_dane_pod dp,
             stat.dgv_kopia_slowniki ikap,
             stat.dot_kategoria k
       where obr.nip = dp.nip
         and ikap.id_rodz_slow = case when @v_typ = 'P' then 'ikapp' else 'ikapw' end
         and @v_data_pom between ikap.data_od and ikap.data_do
         and convert (bigint, obr.wartosc) between convert (bigint, ikap.kwota) and convert (bigint, ikap.kwota2) - 0.01
         and convert (bigint, obr.wartosc) != 0
         and dp.id_pod = k.id_pod
         and k.rodz_kat = @v_typ
         and month (@v_data_pom) between k.wazna_od_mies and isnull (k.wazna_do_mies, 12)
         and year (@v_data_pom) between k.wazna_od_rok and isnull (k.wazna_do_rok, 2100)
         and k.kategoria < ikap.symbol
         and k.wazna_do_mies is null;
      -- ... ustawienie priorytetow na podstawie obrotow zrealizowanych w okresie narastajacym
      --     (styczen - miesiac sprawozdawczy) roku biezacego o ile priorytet idzie w gore
    print 'insert into dot_kategoria';
    insert into stat.dot_kategoria
      select dp.id_pod           id_pod,
             null                nr_poz,
             @v_typ              rodz_kat,
             ikap.symbol         kategoria,
             null                zakres_szczeg,
             month (@v_data_pom) wazna_od_mies,
             year (@v_data_pom)  wazna_od_rok,
             null                wazna_do_mies,
             null                wazna_do_rok,
             getdate ()          w_systemie_od
        from (select nip,
                     sum(wartosc) wartosc
                from tmp.[dot_sum_dekl_nip]
               where typ = @v_typ
				 and RokMc BETWEEN dbo.KonwertujMiRNaRokMc(1, year(@v_data_pom)) AND dbo.KonwertujMiRNaRokMc(month(@v_data_pom), year(@v_data_pom))
                 group by nip
              ) obr,
             stat.dgv_kopia_intr_dane_pod dp,
             stat.dgv_kopia_slowniki ikap
       where obr.nip = dp.nip
         and ikap.id_rodz_slow = case when @v_typ = 'P' then 'ikapp' else 'ikapw' end
         and @v_data_pom between ikap.data_od and ikap.data_do
         and convert (bigint, obr.wartosc) != 0
         and convert (bigint, obr.wartosc) between convert (bigint, ikap.kwota) and convert (bigint, ikap.kwota2) - .01
         and (    exists (select 1
                            from stat.dot_kategoria k
                           where k.id_pod = dp.id_pod
                             and k.rodz_kat = @v_typ
                             and month (@v_data_pom) between k.wazna_od_mies and isnull (k.wazna_do_mies, 12)
                             and year (@v_data_pom) between k.wazna_od_rok and isnull (k.wazna_do_rok, 2100)
                             and k.kategoria < ikap.symbol)
               or not exists (select 1
                                from stat.dot_kategoria k
                               where k.id_pod = dp.id_pod
                                 and k.rodz_kat = @v_typ
                                 and month (@v_data_pom) between k.wazna_od_mies and isnull (k.wazna_do_mies, 12)
                                 and year (@v_data_pom) between k.wazna_od_rok and isnull (k.wazna_do_rok, 2100))
             );
      --
      -- skok do kolejnego miesiaca
      select @v_data_pom = dateadd (month, 1, @v_data_pom);
    end;
    --
    select @v_pom = @v_pom + 1;
  end;
  --
  -- okresy
  exec stat.DziennikWpisInfo 'start: - okresy', @@PROCID;
  --
  select @v_data_pom = @p_data_od;
  --
  truncate table stat.dot_okres_sprawozd;
  --
  -- tabela pomocnicza przechowujaca wszystkie dane, aby mozna bylo ustawic wlasciwy status i wskaznik progowy
  TRUNCATE TABLE tmp.deklaracje;

  --
  -- dane z deklaracji
  insert into tmp.deklaracje
  (nip, id_pod, RokMc, typ, wartosc_dekl, warunki_dostawy,rodzaj_transportu, wartosc_stat )
    select nip,
           id_pod,
           RokMc,
           typ,
           sum (wartosc) wartosc,
           sum (warunki_dostawy) warunki_dostawy,
           sum (rodzaj_transportu) rodzaj_transportu,
           sum (wartosc_stat) wartosc_stat
      from (select dp.nip nip,
                   dp.id_pod id_pod,
                   dwd.RokMc,
                   dwd.typ typ,
                   sum (isnull (dwp.wartosc_faktury, dwp.wartosc_stat)) wartosc,
                   sum (case when dwp.id_dok is not null and ltrim (isnull (warunki_dostawy, '')) = '' then 1 else 0 end) warunki_dostawy,
                   sum (case when dwp.id_dok is not null and ltrim (isnull (rodzaj_transportu, '')) = '' then 1 else 0 end) rodzaj_transportu,
                   sum (case when dwp.id_dok is not null and ltrim (isnull (convert (varchar, wartosc_stat), '')) = '' then 1 else 0 end) wartosc_stat
              from stat.dgv_kopia_istat_dekl_wynik_dok as dwd,
                   stat.dgv_kopia_istat_dekl_wynik_poz as dwp,
                   stat.dgv_kopia_intr_dane_pod as dp         
             where dp.nip = dwd.nip_zobowiazanego
               and dwd.id_dok = dwp.id_dok
               and dwd.[Status] != 'U'
               and dwp.[Status] = 'Y'
			   and dwd.RokMc <= dbo.KonwertujDateNaRokMc(@p_data_do)
             group by dp.nip,
                   dp.id_pod,
                   dwd.RokMc,
                   dwd.typ
             union
            select dp.nip nip,
                   dp.id_pod id_pod,
                   dwd.RokMc,
                   dwd.typ typ,
                   0 wartosc,
                   0 warunki_dostawy,
                   0 rodzaj_transportu,
                   0 wartosc_stat
              from stat.dgv_kopia_istat_dekl_wynik_dok as dwd,
                   stat.dgv_kopia_intr_dane_pod as dp
             where dp.nip = dwd.nip_zobowiazanego
               and dwd.[Status] != 'U'
			   and dwd.RokMc <= dbo.KonwertujDateNaRokMc(@p_data_do)
               and not exists (select 1 from stat.dgv_kopia_istat_dekl_wynik_poz dwp where dwp.id_dok = dwd.id_dok and dwp.[Status] = 'Y')
           ) a
     group by nip,
              id_pod,
              RokMc,
              typ;

  --
  -- dane z vat
  update tmp.deklaracje
     set wartosc_rdin = case when d.typ = 'P' then r.trans_nabycie else r.trans_dostawa end
    from tmp.deklaracje d,
		 stat.dgv_kopia_intr_rdin r --
   where d.nip = r.[NIP]
     and d.RokMc = r.RokMc
     and r.status_us != 'A'
	 /*and r.okres_od = '201201' --dodane
	 and r.okres_do = '201305'
	 and r.generacja = 1*/;
  --
  update tmp.deklaracje
     set wspolczynnik = s.kwota
    from tmp.deklaracje d,
         stat.dgv_kopia_slowniki s
   where s.id_rodz_slow = 'ist_pp'
     and d.RokMc between dbo.KonwertujDateNaRokMc(s.data_od) and dbo.KonwertujDateNaRokMc(s.data_do)
     and d.typ = 'P';

  -- wspoczynnik
  update tmp.deklaracje
     set wspolczynnik = s.kwota
    from tmp.deklaracje d,
         stat.dgv_kopia_slowniki s
   where s.id_rodz_slow = 'ist_wp'
     and d.RokMc between dbo.KonwertujDateNaRokMc(s.data_od) and dbo.KonwertujDateNaRokMc(s.data_do)
     and d.typ = 'W';
  --
  update tmp.deklaracje
     set wspolczynnik = 100
   where wspolczynnik is null;
  --
  -- wlasnosc terytorialna
  update tmp.deklaracje
     set id_jedn = (select top 1 w.identyfikator
                      from stat.dgt_kopia_intr_wlasc_terytor w --
                     where d.id_pod = w.id_pod
                       and d.RokMc between w.WaznaOdRokMc and w.WaznaDoRokMc
					   /*and w.okres_od = '201201' --dodane
					   and w.okres_do = '201305'
					   and w.generacja = 1*/
)    
    from tmp.deklaracje d;
  -- 
  -- wstawienie rekordow do okresow z deklaracji
  insert into stat.dot_okres_sprawozd
  select dp.id_pod id_pod,
         null nr_poz,
         d.RokMc,
         k.rodz_kat typ,
         case when k.kategoria = 2 then
                   case when d.wartosc_rdin is null then 'B'
                        when d.wartosc_rdin is not null and d.wartosc_dekl >= d.wartosc_rdin * (d.wspolczynnik * .01) then 'P'
                        when d.wartosc_rdin is not null and d.wartosc_dekl < d.wartosc_rdin * (d.wspolczynnik * .01) then 'V'
                    end
              when k.kategoria = 3 then
                   case when d.wartosc_rdin is null and warunki_dostawy + rodzaj_transportu + wartosc_stat = 0 then 'B'
                        when d.wartosc_rdin is null and warunki_dostawy + rodzaj_transportu + wartosc_stat > 0 then 'Y'
                        when     d.wartosc_rdin is not null and d.wartosc_dekl >= d.wartosc_rdin * (d.wspolczynnik * .01)
                             and warunki_dostawy + rodzaj_transportu + wartosc_stat = 0 then 'P' 
                        when     d.wartosc_rdin is not null and d.wartosc_dekl >= d.wartosc_rdin * (d.wspolczynnik * .01)
                             and warunki_dostawy + rodzaj_transportu + wartosc_stat > 0 then 'W' 
                        when     d.wartosc_rdin is not null and d.wartosc_dekl < d.wartosc_rdin * (d.wspolczynnik * .01)
                             and warunki_dostawy + rodzaj_transportu + wartosc_stat = 0 then 'V' 
                        when     d.wartosc_rdin is not null and d.wartosc_dekl < d.wartosc_rdin * (d.wspolczynnik * .01)
                             and warunki_dostawy + rodzaj_transportu + wartosc_stat > 0 then 'G' 
                    end
          end as [status],
         isnull (d.id_jedn, '000000') id_jedn,
         case when k.kategoria = 2 then
                   case when d.wartosc_rdin is not null and d.wartosc_dekl >= d.wartosc_rdin * (d.wspolczynnik * .01)
                        then 'T'
                        else 'N'
                    end
              when k.kategoria = 3 then
                   case when     d.wartosc_rdin is not null and d.wartosc_dekl >= d.wartosc_rdin * (d.wspolczynnik * .01)
                             and warunki_dostawy + rodzaj_transportu + wartosc_stat = 0
                        then 'T' 
                        else 'N'
                    end
          end wsk_popraw,
         null operator,
         getdate () data_zmiany,
         case when d.wartosc_rdin is not null and d.wartosc_dekl < d.wartosc_rdin * (d.wspolczynnik * .01)
              then d.wartosc_rdin - d.wartosc_dekl
          end roznica_V_I
    from stat.dgv_kopia_intr_dane_pod dp,
         tmp.deklaracje d,
         stat.dot_kategoria k,
		 stat.dgv_kopia_intr_ape a
   where dp.id_pod = d.id_pod
     and dp.id_pod = k.id_pod
     and dp.id_pod = a.id_pod
     and d.typ = k.rodz_kat
     and k.kategoria != 1
     and d.RokMc between k.WaznaOdRokMc and k.WaznaDoRokMc
     and a.ape in ('11', '12', '13', '14')
     and d.RokMc between a.[WaznaOdRokMc] and a.[WaznaDoRokMc]
	 
  --
  -- wstawienie rekordow do okresow dla podmiotow, ktore nie maja deklaracji
  select @v_data_pom = @p_data_od;
  --
  while @v_data_pom < @p_data_do
  begin
    declare @v_RokMc int = dbo.KonwertujDateNaRokMc(@v_data_pom);
    insert into stat.dot_okres_sprawozd
    select dp.id_pod id_pod,
           null nr_poz,
		   @v_RokMc as RokMc,
           k.rodz_kat typ,
           'N' as [status],
           isnull ((select top 1 w.identyfikator
                      from stat.dgv_kopia_intr_wlasc_terytor as w
                     where dp.id_pod = w.id_pod
					   and dbo.KonwertujDateNaRokMc(@v_data_pom) between [WaznaOdRokMc] and [WaznaDoRokMc]
                   ), '000000') id_jedn,
           'N' wsk_popraw,
           null operator,
           getdate() data_zmiany,
           null roznica_V_I
      from stat.dgv_kopia_intr_dane_pod dp, 
           stat.dot_kategoria k,
		   stat.dgv_kopia_intr_ape a
     where dp.id_pod = k.id_pod
       and dp.id_pod = a.id_pod
       and k.kategoria != 1
       and @v_RokMc between k.WaznaOdRokMc and k.WaznaDoRokMc
       and a.ape in ('11', '12', '13', '14')
       and @v_RokMc between a.WaznaOdRokMc and a.WaznaDoRokMc
       and not exists (select 1 from tmp.deklaracje as d where d.id_pod = dp.id_pod and d.typ = k.rodz_kat and d.RokMc = @v_RokMc)
	;
    --
    -- skok do kolejnego miesiaca
    select @v_data_pom = dateadd (month, 1, @v_data_pom);
  end;
  --
  -- wyczyszczenie/usuniecie tablic tymczasowych
  TRUNCATE TABLE tmp.dot_sum_dekl_nip;
  TRUNCATE TABLE tmp.deklaracje;
  --
  exec stat.DziennikWpisInfo 'stop', @@PROCID;;
end;