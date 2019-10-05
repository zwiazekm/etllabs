CREATE PROCEDURE [stat].dop_pierwszy_termin_ponizej_asymilacji
  @p_data_do date,
  @p_typ  CHAR(1)
as
  --
  exec stat.DziennikWpisInfo 'start: dop_pierwszy_termin_ponizej_asymilacji', @@PROCID;
  --
  print 'Procedura dop_pierwszy_termin_ponizej_asymilacji'
  print 'Parametry:'
  print '@p_data_do = ' + convert (varchar, @p_data_do, 111)
  print '@p_typ = ' + @p_typ
  -- Deklaracje
  -- ... zmienne pomocnicze
  declare @v_wartosc_stat     integer
  declare @v_wartosc_stat_pom integer
  declare @v_sr_mies_stat     integer
  declare @v_id_pod           varchar (35)
  -- ... tabele pomocnicze


TRUNCATE TABLE stat.dot_struktura_ponizej_asymilacji_tmp;

  --
  -- Generacja danych
  --
  print '... pobranie sredniej miesiecznej wartosci statystycznej podmiotow ponizej progu asymilacji w roku poprzednim'
  select @v_sr_mies_stat = case when @p_typ = 'P' then obr.sr_mies_stat_przywoz else obr.sr_mies_stat_wywoz end
    from stat.dot_obroty_roczne obr,
         dgv_kopia_intr_dane_pod dp
   where obr.nip = '0000000000'
     and obr.rok = year (@p_data_do) - 1
 --    and dp.nip = '0000000000'
--     and dp.regon = '00000000000000'

  print '... wybor z tabeli intr_obroty_biezace podmiotu o najnizszym przywozie w miesiacu sprawozdawczym (kategoria <> 1, obroty <> 0)'
  declare c_obroty_biezace cursor for
    select ob.id_pod,
           case when @p_typ = 'P' then ob.stat_przywoz else ob.stat_wywoz end
      from stat.dot_obroty_biezace ob,
           dgv_kopia_intr_dane_pod dp,
           dot_kategoria k
     where ob.id_pod = dp.id_pod
       and dp.id_pod = k.id_pod
       and k.kategoria <> 1
       and k.rodz_kat = @p_typ
       and ob.RokMc = dbo.KonwertujDateNaRokMc( @p_data_do )
	   and ob.RokMc between k.WaznaOdRokMc and k.WaznaDoRokMc
       and case when @p_typ = 'P' then ob.stat_przywoz else ob.stat_wywoz end <> 0
     order by RokMc desc,
           case when @p_typ = 'P' then ob.stat_przywoz else ob.stat_wywoz end
  open c_obroty_biezace

  print '... pobranie pierwszej najnizszej wartosci o ile istnieje'
  fetch c_obroty_biezace
    into @v_id_pod, @v_wartosc_stat
  print '@v_id_pod = ' + @v_id_pod

  exec stat.DziennikWpisInfo 'start: wstawienie do pomocniczej tabeli niezagregowanych danych', @@PROCID;
  insert into stat.dot_struktura_ponizej_asymilacji_tmp
    select @p_typ typ,
           dwd.RokMc,
           dwp.kod_towarowy kod_towarowy,
           dwp.kraj_przezn_wysyl kraj_przezn_wysylki,
           dwp.kraj_pochodzenia kraj_pochodzenia,
           dwp.rodzaj_transakcji rodzaj_transakcji,
           null udzial_w_obrotach,
           dwp.wartosc_stat wartosc_stat
      from stat.dot_dekl_wynik_poz_nowa_wartosc_stat dwp,
           dgv_kopia_istat_dekl_wynik_dok dwd,
           dgv_kopia_intr_dane_pod dp
     where dwp.id_dok = dwd.id_dok
       and dwd.nip_zobowiazanego = dp.nip
       and dwd.[Status] != 'U'
       and dwd.typ = @p_typ
       and dwp.[Status] = 'Y'
	   and dwd.RokMc = dbo.KonwertujDateNaRokMc(@p_data_do)
       and dp.id_pod = @v_id_pod
       and dwp.wartosc_stat is not null -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
  print '... dopoki "wartosc statystyczna podmiotu o najnizszym przywozie w miesiacu sprawozdawczym"'
  print '    jest mniejsza od "sredniej miesiecznej wartosci statystycznej podmiotow ponizej progu asymilacji w roku poprzednim"'
  print '    to pobieramy wartosc statystyczna kolejnego podmiotu o najnizszym przywozie w miesiacu sprawozdawczym'
  -- ... dopoki "wartosc statystyczna podmiotu o najnizszym przywozie w miesiacu sprawozdawczym"
  --     jest mniejsza od "sredniej miesiecznej wartosci statystycznej podmiotow ponizej progu asymilacji w roku poprzednim"
  --     to pobieramy wartosc statystyczna kolejnego podmiotu o najnizszym przywozie w miesiacu sprawozdawczym
  while (@v_wartosc_stat < @v_sr_mies_stat and @@FETCH_STATUS = 0)
  begin
    fetch c_obroty_biezace
      into @v_id_pod, @v_wartosc_stat_pom
    if @@FETCH_STATUS = 0
      begin
--        print '... ... dodanie kolejnej wartosci statystycznej'
        -- ... ... dodanie kolejnej wartosci statystycznej
        SET @v_wartosc_stat = @v_wartosc_stat + isnull (@v_wartosc_stat_pom, 0);
--        print '-- ... ... wstawienie do pomocniczej tabeli niezagregowanych danych'
        -- ... ... wstawienie do pomocniczej tabeli niezagregowanych danych
--  exec stat.DziennikWpisInfo 'start: wstawienie do pomocniczej tabeli niezagregowanych danych'
        insert into stat.dot_struktura_ponizej_asymilacji_tmp
          select @p_typ typ,
                 dwd.RokMc,
                 dwp.kod_towarowy kod_towarowy,
                 dwp.kraj_przezn_wysyl kraj_przezn_wysylki,
                 dwp.kraj_pochodzenia kraj_pochodzenia,
                 dwp.rodzaj_transakcji rodzaj_transakcji,
                 null udzial_w_obrotach,
                 dwp.wartosc_stat wartosc_stat
            from stat.dot_dekl_wynik_poz_nowa_wartosc_stat dwp,
                 dgv_kopia_istat_dekl_wynik_dok dwd,
                 dgv_kopia_intr_dane_pod dp
           where dwp.id_dok = dwd.id_dok
             and dwd.nip_zobowiazanego = dp.nip
             and dwd.[Status] != 'U'
             and dwd.typ = @p_typ
             and dwp.[Status] = 'Y'
			 and dwd.RokMc = dbo.KonwertujDateNaRokMc(@p_data_do)
             and dp.id_pod = @v_id_pod
             and dwp.wartosc_stat is not null -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
      end 
  end
  --
  close c_obroty_biezace;
  deallocate c_obroty_biezace;


  print '... wykonanie wpisow do tabeli dot_struktura_ponizej_asymilacji na podstawie danych wybranych podmiotow'
  print '    zapamietanych w tabeli dot_struktura_ponizej_asymilacji_tmp'
  exec stat.DziennikWpisInfo 'start: wykonanie wpisow do tabeli dot_struktura_ponizej_asymilacji na podstawie danych wybranych podmiotow', @@PROCID;
  insert into stat.dot_struktura_ponizej_asymilacji
    select typ,
           RokMc,
           kod_towarowy,
           kraj_przezn_wysylki,
           kraj_pochodzenia,
           rodzaj_transakcji,
           sum (wartosc_stat) / @v_wartosc_stat udzial_w_obrotach 
      from stat.dot_struktura_ponizej_asymilacji_tmp
     group by typ,
           RokMc,
           kod_towarowy,
           kraj_przezn_wysylki,
           kraj_pochodzenia,
           rodzaj_transakcji
    having convert (decimal (5,4), sum (wartosc_stat) / @v_wartosc_stat) != 0
  print '... dezagregacja sredniej misiecznej wartosci statystycznej podmiotow ponizej progu'
  print '    asymilacji za pomoca tabeli dot_struktura_ponizej_asymilacji'
  -- ... dezagregacja sredniej misiecznej wartosci statystycznej podmiotow ponizej progu
  --     asymilacji za pomoca tabeli dot_struktura_ponizej_asymilacji
  -- ... wpisanie naglowka i wyznaczonych pozycji do tabel deklaracji doszacowanych
  -- ... podzielenie wartosci statystycznej przez srednia z widelek cenowych dla danego kodu towaru,
  --     wpisanie wyliczonej wartosci w pole masa_netto pozycji
  -- ... jezeli dany kod towaru posiada uzupelniajaca jednostke miary, podzielenie obliczonej wartosci przez srednia z widelek
  --     wagowych dla danego kodu towaru, wspisanie wyliczonej wartosci w pole uzupelniajaca_jm pozycji
  -- ... wpisanie wartosci statystycznej w pole wartosc_faktury pozycji
  -- ... wpisanie w pole wskaznik_progowego wartosci 3
  -- ... ... wstawienie naglowka
  -- ... ... ... pobranie kolejnej wartosci z sekwencji
  declare @v_dwd_seq integer
  exec stat.nextval 'dwd_seq', @v_dwd_seq OUTPUT
  -- ... ... ... generacja id naglowka
  declare @v_id varchar (35)
  select @v_id = 'ISTD/' + 
                 replace (replace (replace (replace (convert (varchar, getdate (), 121), '-', ''), ' ', ''), ':', ''), '.', '') + 
                 right ('0000000000000' + convert (varchar, @v_dwd_seq), 13)
  print '... ... ... wstawienie naglowka do bazy'
  insert into dot_dekl_wynik_dok
    select @v_id id,
           'Y' status,
           '0000000000' nip_zobowiazanego,
           '00000000000000' regon_zobowiazanego,
           @p_typ typ,
           year (@p_data_do) *100 + month (@p_data_do) RokMc,
           1 numer

  print '... ... wstawienie pozycji'
  exec stat.DziennikWpisInfo 'start: wstawienie pozycji', @@PROCID;
	-- utworzenie tabeli tymczasowej
	select * into #dot_dekl_wynik_poz from stat.dot_dekl_wynik_poz where 1=2;
    with slowniki12 as (select symbol, kwota1 wartosc from stat.dgv_kopia_slowniki_pk where id_rodz_slow = 'sl_c_' + lower (@p_typ)),
         slowniki34 as (select symbol, kwota2 wartosc from stat.dgv_kopia_slowniki_pk where id_rodz_slow = 'sl_c_' + lower (@p_typ))

  	insert into #dot_dekl_wynik_poz
    	select @v_id id,
           null pozid,
           'Y' status,
           null komentarz,
           null opis_towaru,
           kraj_przezn_wysylki kraj_przezn_wysyl,
           null warunki_dostawy,
           rodzaj_transakcji rodzaj_transakcji,
           null rodzaj_transportu,
           kod_towarowy kod_towarowy,
           kraj_pochodzenia kraj_pochodzenia,
           /*round(round((@v_sr_mies_stat * udzial_w_obrotach),0) /
                         case when isnull (slowniki12.wartosc, 0) != 0
                              then slowniki12.wartosc
                              else null
                          end,0)
           masa_netto,
           round(round((@v_sr_mies_stat * udzial_w_obrotach),0) /
             case when isnull (slowniki34.wartosc, 0) != 0
                  then slowniki34.wartosc
                  else null
              end,0)
           uzup_jm,*/
	   null masa_netto,
	   null uzup_jm,	
           round(@v_sr_mies_stat * udzial_w_obrotach,0) wartosc_faktury,
           round(@v_sr_mies_stat * udzial_w_obrotach,0) wartosc_statystyczna,
           '3' wsk_progowy,
           null
      	from stat.dot_struktura_ponizej_asymilacji
		left join slowniki12 on kod_towarowy = slowniki12.symbol
		left join slowniki34 on kod_towarowy = slowniki34.symbol
     	where RokMc = dbo.KonwertujDateNaRokMc(@p_data_do)
       	  and typ = @p_typ
	 --
  exec stat.DziennikWpisInfo 'start: dop_szacowanie_masy_i_ilosci', @@PROCID;
  --
        exec stat.DziennikWpisInfo '  - szacowanie masy na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna b 
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
	exec stat.DziennikWpisInfo '  - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
        exec stat.DziennikWpisInfo '  - szacowanie masy na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))          
         from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_rodztran b, dot_wspolczynnik_k c
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
	exec stat.DziennikWpisInfo '  - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
	--
        exec stat.DziennikWpisInfo '  - szacowanie masy na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))          
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_kraje b, dot_wspolczynnik_k c
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
	--
        exec stat.DziennikWpisInfo '  - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
         from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_kraje b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
        exec stat.DziennikWpisInfo '  - szacowanie masy na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))          
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100-1 = b.rok
	--
        exec stat.DziennikWpisInfo '  - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                   isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                             from stat.dot_wspolczynnik_k c
                                            where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                  else null end))
        from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100-1 = b.rok
        --
	--
        exec stat.DziennikWpisInfo '  - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna b 
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
	exec stat.DziennikWpisInfo '  - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
  exec stat.DziennikWpisInfo '  - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
	exec stat.DziennikWpisInfo '  - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
	--
        exec stat.DziennikWpisInfo '  - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
	--
        exec stat.DziennikWpisInfo '  - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
         from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_kraje b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
        exec stat.DziennikWpisInfo '  - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
            set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
         from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100 = b.rok
	--
        exec stat.DziennikWpisInfo '  - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
         from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100 = b.rok
        --
        exec stat.DziennikWpisInfo '  - koniec szacowania na podstawie struktury ubiegłorocznej', @@PROCID;
	
	-- usunięcie pozycji które powinny mieć wypełnioną ilość w uzupełniającej jednostce miary a nie mają
	delete from #dot_dekl_wynik_poz
	where uzup_jm is null and 
		exists (select 1 from tbl_sl_taryfa_cn8 
		where #dot_dekl_wynik_poz.kod_towarowy = tbl_sl_taryfa_cn8.kod_cn and
			tbl_sl_taryfa_cn8.nazwa_jm is not null)

	-- przepisanie danych
    	insert into dot_dekl_wynik_poz (id, pozid, status, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji, rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_faktury, wartosc_statystyczna, wskaznik_progowy, nr_grp)
        select id, pozid, status, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji, rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_faktury, wartosc_statystyczna, wskaznik_progowy, nr_grp
        from #dot_dekl_wynik_poz

	-- Usuniecie tabel pomocniczych
  	TRUNCATE TABLE stat.dot_struktura_ponizej_asymilacji_tmp;
	DROP TABLE #dot_dekl_wynik_poz;

  	-- Usuniecie niepotrzebnych danych
  	truncate table stat.dot_struktura_ponizej_asymilacji
  	--
  	exec stat.DziennikWpisInfo 'stop: dop_pierwszy_termin_ponizej_asymilacji', @@PROCID;