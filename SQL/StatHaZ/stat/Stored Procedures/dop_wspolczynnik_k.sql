CREATE PROCEDURE [stat].dop_wspolczynnik_k 
@p_data_do date

as
begin
    declare @v_tekst varchar(1024)
    declare @v_kcnkg_min numeric(4,2)
    declare @v_kcnkg_max numeric(4,2)
    declare @v_kcnj_min numeric(4,2)
    declare @v_kcnj_max numeric(4,2)
    declare @v_k_min numeric(4,2)
    declare @v_k_max numeric(4,2)
    declare @v_obroty_min numeric(20)
   
    
    declare @v_rok int=year(@p_data_do);
    declare @v_miesiac_do int = month(@p_data_do);
	declare @RokMcDo int = dbo.[KonwertujDateNaRokMc](@p_data_do);

    set @v_tekst = 'start: dop_wspolczynnik_k: @v_rok='+convert(varchar(4),@v_rok) + ' @p_data_do: '+ convert(varchar,@p_data_do)

    exec stat.DziennikWpisInfo @v_tekst, @@PROCID

    select @v_kcnkg_min = isnull(convert(numeric(4,2),value),0.95) from params where keyword='kcnkg_min' and section='GEN'
    select @v_kcnkg_max = isnull(convert(numeric(4,2),value),0.95) from params where keyword='kcnkg_max' and section='GEN'
    select @v_kcnj_min = isnull(convert(numeric(4,2),value),0.95) from params where keyword='kcnj_min' and section='GEN'
    select @v_kcnj_max = isnull(convert(numeric(4,2),value),0.95) from params where keyword='kcnj_max' and section='GEN'
    select @v_k_min = isnull(convert(numeric(4,2),value),0.95) from params where keyword='k_min' and section='GEN'
    select @v_k_max = isnull(convert(numeric(4,2),value),0.95) from params where keyword='k_max' and section='GEN'
    select @v_obroty_min = isnull(convert(numeric,value),0) from params where keyword='obroty_min_dla_k' and section='GEN'      


    truncate table stat.dot_wspolczynnik_k;
    truncate table stat.dot_mies_wspolczynnik_k;


	with a as 
				(select p.kod_towarowy kod_towarowy,
                          w.RokMc % 100 as miesiac,
                          p.avg_cena_za_kilogram avg_cena_za_kilogram_p,
                          w.avg_cena_za_kilogram avg_cena_za_kilogram_w,
                          p.avg_cena_za_sztuke avg_cena_za_sztuke_p,
                          w.avg_cena_za_sztuke avg_cena_za_sztuke_w
                     from stat.dot_struktura_miesieczna_agr_kraje p, 
						  stat.dot_struktura_miesieczna_agr_kraje w
                    where p.kod_towarowy = w.kod_towarowy and p.typ='P' and w.typ='W' 
					  and p.RokMc = w.RokMc and p.RokMc = @RokMcDo - 100		--Rok poprzedni
                    union all
                    select kod_towarowy,
                          RokMc % 100 as miesiac,
                          (case when typ = 'P' then avg_cena_za_kilogram  else null end) avg_cena_za_kilogram_p,
                          (case when typ = 'W' then avg_cena_za_kilogram  else null end) avg_cena_za_kilogram_w,
                          (case when typ = 'P' then avg_cena_za_sztuke  else null end) avg_cena_za_sztuke_p,
                          (case when typ = 'W' then avg_cena_za_sztuke  else null end) avg_cena_za_sztuke_w
                     from stat.dot_struktura_miesieczna_agr_kraje p
                    where p.RokMc / 100 = @v_rok-1
                      and not exists (select 1 
                                        from stat.dot_struktura_miesieczna_agr_kraje w
                                       where p.kod_towarowy = w.kod_towarowy  and p.RokMc = w.RokMc and p.typ <> w.typ ))
  insert into stat.dot_wspolczynnik_k
       select a.kod_towarowy, 
              a.miesiac, 
              isnull(convert(numeric(15,6),(select case when a.avg_cena_za_kilogram_p >0 then b.avg_cena_za_kilogram/a.avg_cena_za_kilogram_p else null end
                                      from stat.dot_struktura_miesieczna_agr_kraje  b
                                     where a.kod_towarowy = b.kod_towarowy and a.miesiac = b.RokMc%100 and b.RokMc/100=@v_rok and b.typ = 'P')),1) as wspolczynnik_Kcnkg_przywoz,     
              isnull(convert(numeric(15,6),(select case when a.avg_cena_za_kilogram_w >0 then b.avg_cena_za_kilogram/a.avg_cena_za_kilogram_w else  null end
                                      from stat.dot_struktura_miesieczna_agr_kraje  b
                                     where a.kod_towarowy = b.kod_towarowy and a.miesiac = b.RokMc%100 and b.RokMc/100=@v_rok and b.typ = 'W')),1) as wspolczynnik_Kcnkg_wywoz,
              isnull(convert(numeric(15,6),(select case when a.avg_cena_za_sztuke_p >0 then b.avg_cena_za_sztuke/a.avg_cena_za_sztuke_p else  null end
                                      from stat.dot_struktura_miesieczna_agr_kraje  b
                                     where a.kod_towarowy = b.kod_towarowy and a.miesiac = b.RokMc%100 and b.RokMc/100=@v_rok and b.typ = 'P')),1) as wspolczynnik_Kcnj_przywoz,
              isnull(convert(numeric(15,6),(select case when a.avg_cena_za_sztuke_w >0 then b.avg_cena_za_sztuke/a.avg_cena_za_sztuke_w else  null end
                                      from stat.dot_struktura_miesieczna_agr_kraje  b
                                     where a.kod_towarowy = b.kod_towarowy and a.miesiac = b.RokMc%100 and b.RokMc/100=@v_rok and b.typ = 'W')),1) as wspolczynnik_Kcnj_wywoz
            from a
            where a.miesiac <= @v_miesiac_do

     update stat.dot_wspolczynnik_k set wspolczynnik_Kcnkg_przywoz=@v_kcnkg_min where wspolczynnik_Kcnkg_przywoz < @v_kcnkg_min
     update stat.dot_wspolczynnik_k set wspolczynnik_Kcnkg_przywoz=@v_kcnkg_max where wspolczynnik_Kcnkg_przywoz > @v_kcnkg_max
     update stat.dot_wspolczynnik_k set wspolczynnik_Kcnj_przywoz=@v_kcnj_min where wspolczynnik_Kcnj_przywoz < @v_kcnj_min 
     update stat.dot_wspolczynnik_k set wspolczynnik_Kcnj_przywoz=@v_kcnj_max where wspolczynnik_Kcnj_przywoz > @v_kcnj_max
    
     update stat.dot_wspolczynnik_k set wspolczynnik_Kcnkg_wywoz=@v_kcnkg_min where wspolczynnik_Kcnkg_wywoz < @v_kcnkg_min
     update stat.dot_wspolczynnik_k set wspolczynnik_Kcnkg_wywoz=@v_kcnkg_max where wspolczynnik_Kcnkg_wywoz > @v_kcnkg_max
     update stat.dot_wspolczynnik_k set wspolczynnik_Kcnj_wywoz=@v_kcnj_min where wspolczynnik_Kcnj_wywoz < @v_kcnj_min
     update stat.dot_wspolczynnik_k set wspolczynnik_Kcnj_wywoz=@v_kcnj_max where wspolczynnik_Kcnj_wywoz > @v_kcnj_max 

      select sum(wartosc_stat) suma_wartosc_stat, RokMc, nip, typ 
        into #suma_rok_miesiac_nip
        from stat.dot_struktura_miesieczna_nip 
    group by typ, RokMc, nip
      having sum(wartosc_stat) >= @v_obroty_min 

    insert into dot_mies_wspolczynnik_k
    select b.RokMc, 
           convert(numeric(15,6),(sum(case when b.typ = 'P' then b.suma_wartosc_stat else 0 end)/sum(case when b.typ = 'P' then a.suma_wartosc_stat else 0 end))) wspolczynnik_K_przywoz,
           convert(numeric(15,6),(sum(case when b.typ = 'W' then b.suma_wartosc_stat else 0 end)/sum(case when b.typ = 'W' then a.suma_wartosc_stat else 0 end))) wspolczynnik_K_wywoz
      from	#suma_rok_miesiac_nip a, 
			#suma_rok_miesiac_nip b 
	where a.nip=b.nip 
		and a.RokMc=b.RokMc-100
		and b.RokMc/100 = @v_rok 
		and a.typ=b.typ
    group by b.RokMc

     update stat.dot_mies_wspolczynnik_k set wspolczynnik_K_przywoz=@v_k_min where wspolczynnik_K_przywoz < @v_k_min
     update stat.dot_mies_wspolczynnik_k set wspolczynnik_K_przywoz=@v_k_max where wspolczynnik_K_przywoz > @v_k_max
     update stat.dot_mies_wspolczynnik_k set wspolczynnik_K_wywoz=@v_k_min where wspolczynnik_K_wywoz < @v_k_min
     update stat.dot_mies_wspolczynnik_k set wspolczynnik_K_wywoz=@v_k_max where wspolczynnik_K_wywoz > @v_k_max

     update stat.dot_mies_wspolczynnik_k set wspolczynnik_K_przywoz=1 where wspolczynnik_K_przywoz is null
     update stat.dot_mies_wspolczynnik_k set wspolczynnik_K_przywoz=1 where wspolczynnik_K_przywoz is null
     update stat.dot_mies_wspolczynnik_k set wspolczynnik_K_wywoz=1 where wspolczynnik_K_wywoz is null
     update stat.dot_mies_wspolczynnik_k set wspolczynnik_K_wywoz=1 where wspolczynnik_K_wywoz is null 
    --
    exec stat.DziennikWpisInfo 'koniec: dop_wspolczynnik_k'
    --

end

-----------------------
--- PODPIS
-----------------------

--insert into raport_skrypt_sql
  --     ( id_jednostki, typ_db, nazwa_skryptu, nr_skryptu, wlasciciel, data_uruchomienia, nr_formularza, nr_zgloszenia)
--values ( 'CAAC', 'MS SQL 2000', 'alter_6.00.000.004_procedury.sql', 4, 'M.Kisza', GetDate(), '', '')