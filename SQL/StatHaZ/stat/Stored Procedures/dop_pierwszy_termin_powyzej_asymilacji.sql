CREATE PROCEDURE [stat].dop_pierwszy_termin_powyzej_asymilacji
  @p_data_do date,
  @p_typ  char(1),
  @p_prog numeric = 0
AS
  --
  exec stat.DziennikWpisInfo 'start', @@PROCID;
  --
  -- tabele pomocnicze
  create table #struktura (
    RokMc int,
    kod_towarowy varchar (8) ,
    kraj_przezn_wysyl varchar (2) ,
    kraj_pochodzenia varchar (2) ,
    rodzaj_transakcji varchar (2) ,
    udzial_w_obrotach decimal(7, 6)
  )
  --
  -- deklaracje zmiennych
  declare @ilosc_rekordow     bigint
  declare @v_wspolczynnik_k_p numeric(15,6)
  declare @v_wspolczynnik_k_w numeric(15,6)
  declare @v_polecenie        nvarchar (4000)
  declare @v_polecenie_im     nvarchar (4000)
  declare @v_polecenie_ek     nvarchar (4000)
  declare @v_suma             bigint
  declare @v_min_intr int
  declare @v_min_vat int
  --
  -- inicjacja zmiennych
  --
    select @v_min_intr = isnull(convert(numeric,value),1) from stat.params where keyword='min_intr' and section='GEN'
    select @v_min_vat = isnull(convert(numeric,value),1) from stat.params where keyword='min_vat' and section='GEN'
--
  --declare @v_rok int
  --declare @v_miesiac int
  --set @v_miesiac = month(@p_data_do)
  --set @v_rok = year(@p_data_do)
  declare @RokMc    int = dbo.KonwertujDateNaRokMc(@p_data_do);
  declare @RokMcPop int = @RokMc - 100;		--Rok wcześniej

  --
  set @v_polecenie_im = '
    insert into #struktura
      select top @1
             im_RokMc                                                          RokMc,
             im_pcn                                                            kod_towarowy,
             im_kraj_wysylki                                                   kraj_przezn_wysyl,
             im_kraj_pochodzenia                                               kraj_pochodzenia,
             im_rodzaj_transakcji                                              rodzaj_transakcji,
             convert (numeric (7,6), convert (float, 1) / convert (float, @1)) udzial_w_obrotach
        from dgt_import_intr
       where im_znacznik_kategorii_progowej = 1
         and im_RokMc = @RokMc
       group by im_RokMc,
             im_pcn,
             im_kraj_wysylki,
             im_kraj_pochodzenia,
             im_rodzaj_transakcji
       order by sum (convert (numeric (15,2), im_wartosc_stat_zl)) desc,1,2,3,4,5,6'
  set @v_polecenie_ek = '
    insert into #struktura
      select top @1
             ek_RokMc														   RokMc,
             ek_pcn                                                            kod_towarowy,
             ek_kraj_przeznaczenia                                             kraj_przezn_wysyl,
             null                                                              kraj_pochodzenia,
             ek_rodzaj_transakcji                                              rodzaj_transakcji,
             convert (numeric (7,6), convert (float, 1) / convert (float, @1)) udzial_w_obrotach
        from dgt_eksport_intr
       where ek_znacznik_kategorii_progowej = 1
         and ek_RokMc = @RokMc
       group by ek_RokMc,
             ek_pcn,
             ek_kraj_przeznaczenia,
             ek_rodzaj_transakcji
       order by sum (convert (numeric (15,2), ek_wartosc_stat_zl)) desc,1,2,3,4,5,6'
  -- 
  -- współczynnik K
  select  @v_wspolczynnik_k_p = wspolczynnik_K_przywoz from stat.dot_mies_wspolczynnik_k where RokMc = @RokMc;
  select  @v_wspolczynnik_k_w = wspolczynnik_K_wywoz from stat.dot_mies_wspolczynnik_k where RokMc = @RokMc;
  --
  select * into #dot_dekl_wynik_dok from stat.dot_dekl_wynik_dok where 1=2
  select * into #dot_dekl_wynik_poz from stat.dot_dekl_wynik_poz where 1=2 
  --
  -- podmioty, które mają strukturę
  exec stat.DziennikWpisInfo 'start: dop_pierwszy_termin_powyzej_asymilacji - wstawienie dokumentów podmiotów, które mają strukturę';
  insert into #dot_dekl_wynik_dok
    select dp.id_pod + '_(3)_' + os.typ + right ('00' + convert (varchar, @RokMc%100), 2) + right (convert (varchar, @RokMc/100), 2) id,           'Y' status,
           obr.nip,
           dp.regon,
           @p_typ typ,
		   dbo.KonwertujDateNaRokMc(@p_data_do) AS RokMc,
           1 AS numer
      from stat.dot_obroty_roczne obr,
           stat.dgv_kopia_intr_dane_pod dp,
           stat.dot_okres_sprawozd os,
           stat.dot_priorytet p
     where obr.nip = dp.nip
       and obr.rok = @RokMc/100 - 1
       and dp.id_pod = os.id_pod
       and dp.id_pod = p.id_pod
       and os.RokMc = @RokMc
	   and os.RokMc between p.WaznaOdRokMc and p.WaznaDoRokMc
       and os.[status] = 'N'
       and os.wsk_popraw = 'N'
       and os.typ = @p_typ
       and os.typ = p.rodzaj_prior
       and p.priorytet > 1
       and (    (os.typ = 'P' and not exists (select 1
                                                from stat.dgt_import_intr
                                               where im_nip = dp.nip
                                                 and im_RokMc = @RokMc ) )
             or (os.typ = 'W' and not exists (select 1
                                                from stat.dgt_eksport_intr
                                               where ek_nip = dp.nip
                                                 and ek_RokMc = @RokMc
                                                 ) )
           )
       and exists (select 1
                     from stat.dot_struktura_priorytet_5_roczna sp5r
                    where sp5r.nip = obr.nip
                      and sp5r.typ = os.typ
                      and sp5r.rok = @RokMc/100 - 1)
       and not exists (select 1 
                         from stat.dot_dekl_wynik_dok dok2 
                        where dok2.nip_zobowiazanego=obr.nip and dok2.typ=@p_typ and dok2.RokMc=@RokMc)
       and not exists (select 1 
                         from stat.dot_podmiot_dane_miesieczne dm 
                        where  dm.RokMc = @RokMcPop and dm.nip = dp.nip 
                         and ((@p_typ='P' and intr_zerowy_przywoz = 'T') or (@p_typ='W' and intr_zerowy_wywoz = 'T')))
       and exists (select 1 
                     from stat.dot_podmiot_dane_roczne dm 
                    where  dm.rok = @RokMc/100 - 1 and dm.nip = dp.nip 
                      and ((@p_typ='P' and ilosc_intrastat_przywoz >= @v_min_intr and ilosc_vat_przywoz >= @v_min_vat) or (@p_typ='W' and ilosc_intrastat_wywoz >= @v_min_intr and ilosc_vat_wywoz >= @v_min_vat)))
    -- Czy od początku roku nie było cały czas zerówek
        and not exists (select 1 from stat.dot_ciaglosc c where c.nip=dp.nip and c.rok=@RokMc/100 and 
                        ((@p_typ='P' and (intr_zerowy_przywoz = 'T' or vat_zerowy_przywoz = 'T')) or (@p_typ='W' and (intr_zerowy_wywoz = 'T' or vat_zerowy_wywoz = 'T'))))
     --
  exec stat.DziennikWpisInfo 'start: dop_pierwszy_termin_powyzej_asymilacji - wstawienie pozycji dokumentów podmiotów, które mają strukturę', @@PROCID;
  insert into #dot_dekl_wynik_poz
    select dp.id_pod + '_(3)_' + os.typ + right ('00' + convert (varchar, @RokMc%100), 2) + right (convert (varchar, @RokMc/100), 2) id,
           null pozid,
           'Y' status,
           null komentarz,
           null opis_towaru,
           sp5r.kraj_przezn_wysyl kraj_przezn_wysyl,
           null warunki_dostawy,
           sp5r.rodzaj_transakcji rodzaj_transakcji,

           null rodzaj_transportu,
           sp5r.kod_towarowy kod_towarowy,
           sp5r.kraj_pochodzenia kraj_pochodzenia,
           null masa_netto,
           null uzup_jm,
           (obr.sr_mies_stat * sp5r.udzial_w_obrotach) * case when @p_typ = 'P' then @v_wspolczynnik_k_p else @v_wspolczynnik_k_w end wartosc_faktury,
           (obr.sr_mies_stat * sp5r.udzial_w_obrotach) * case when @p_typ = 'P' then @v_wspolczynnik_k_p else @v_wspolczynnik_k_w end wartosc_statystyczna,
           '4' wsk_progowy,
           null
      from (select nip,
                   rok,
                   case when @p_typ = 'P' then sr_mies_stat_przywoz else sr_mies_stat_wywoz end sr_mies_stat
              from stat.dot_obroty_roczne
           ) obr,
           stat.dgv_kopia_intr_dane_pod dp,
           stat.dot_okres_sprawozd os,
           stat.dot_priorytet p,
           stat.dov_struktura_priorytet_5_roczna sp5r
     where obr.nip = dp.nip
       and obr.rok = @RokMc/100 - 1
       and dp.id_pod = os.id_pod
       and dp.id_pod = p.id_pod
       and obr.nip = sp5r.nip
       and sp5r.rok = @RokMc/100 - 1
       and os.RokMc = @RokMc
	   and os.RokMc BETWEEN p.WaznaOdRokMc AND p.WaznaDoRokMc
       and os.[status] = 'N'
       and os.wsk_popraw = 'N'
       and os.typ = @p_typ
       and os.typ = p.rodzaj_prior
       and os.typ = sp5r.typ
       and sp5r.udzial_w_obrotach > 0.0001
       and p.priorytet > 1
       and exists (select 1 
                    from #dot_dekl_wynik_dok dok2 
                   where dok2.nip_zobowiazanego=obr.nip and dok2.typ=@p_typ and dok2.RokMc = @RokMc )
  --
  -- Szacowanie masy i ilości na podstawie struktury globalnej
  --  
  --
	select count(*), 'przed str' from #dot_dekl_wynik_poz where masa_netto is null;
  --
  --
  exec stat.DziennikWpisInfo 'start: dop_szacowanie_masy_i_ilosci', @@PROCID;
  --
        exec stat.DziennikWpisInfo ' - szacowanie masy na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna b 
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
	exec stat.DziennikWpisInfo ' - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
        exec stat.DziennikWpisInfo ' - szacowanie masy na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))          
         from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_rodztran b, stat.dot_wspolczynnik_k c
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
	exec stat.DziennikWpisInfo ' - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
	--
        exec stat.DziennikWpisInfo ' - szacowanie masy na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))          
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_kraje b, stat.dot_wspolczynnik_k c
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
	--
        exec stat.DziennikWpisInfo ' - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
         from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_kraje b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
        exec stat.DziennikWpisInfo ' - szacowanie masy na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))          
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100-1 = b.rok
	--
        exec stat.DziennikWpisInfo ' - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                   isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                             from stat.dot_wspolczynnik_k c
                                            where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                  else null end))
        from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100-1 = b.rok
        --
	--
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna b 
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
	exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
  exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
	exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
	--
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_kraje b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
	--
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
         from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_kraje b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
            set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
         from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100 = b.rok
	--
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
         from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100 = b.rok
        --
        exec stat.DziennikWpisInfo ' - koniec szacowania na podstawie struktury ubiegłorocznej', @@PROCID;
	  --
	select count(*), 'po str' from #dot_dekl_wynik_poz where masa_netto is null;
  --
-- usunięcie pozycji które powinny mieć wypełnioną ilość w uzupełniającej jednostce miary a nie mają
	delete from #dot_dekl_wynik_poz
	where uzup_jm is null and 
		exists (select 1 from stat.tbl_sl_taryfa_cn8 
		where #dot_dekl_wynik_poz.kod_towarowy = tbl_sl_taryfa_cn8.kod_cn and
			tbl_sl_taryfa_cn8.nazwa_jm is not null)  

-- usunięcie nagłówków dokumentów które nie posiadają pozycji
	delete from #dot_dekl_wynik_dok
	where not exists (select 1 from #dot_dekl_wynik_poz where #dot_dekl_wynik_poz.id = #dot_dekl_wynik_dok.id)    

    -- przepisanie danych
    insert into dot_dekl_wynik_dok 
         select * from #dot_dekl_wynik_dok
    insert into dot_dekl_wynik_poz (id, pozid, status, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji, rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_faktury, wartosc_statystyczna, wskaznik_progowy, nr_grp)
         select id, pozid, status, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji, rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_faktury, wartosc_statystyczna, wskaznik_progowy, nr_grp
           from #dot_dekl_wynik_poz
  --
  -- wyczysczenie tabel tymczasowych
  truncate table #dot_dekl_wynik_dok
  truncate table #dot_dekl_wynik_poz
  --
  -- podmioty, które nie mają struktury
  -- zliczenie ilości rekordów
  select @ilosc_rekordow = round(sum (case when @p_typ = 'P' then sr_mies_stat_przywoz else sr_mies_stat_wywoz end) / 1000,0)
    from stat.dot_obroty_roczne obr,
         stat.dgv_kopia_intr_dane_pod dp,
         stat.dot_okres_sprawozd os,
         stat.dot_priorytet p
   where obr.nip = dp.nip
     and obr.rok = @RokMc / 100 - 1
     and dp.id_pod = os.id_pod
     and dp.id_pod = p.id_pod
     and os.RokMc = @RokMc
	 and os.RokMc BETWEEN p.WaznaOdRokMc AND p.WaznaDoRokMc
     and os.[status] = 'N'
     and os.wsk_popraw = 'N'
     and os.typ = @p_typ
     and os.typ = p.rodzaj_prior
     and p.priorytet > 1
     and (    (os.typ = 'P' and not exists (select 1
                                              from stat.dgt_import_intr
                                             where im_nip = dp.nip
											   and im_RokMc = @RokMc ))
           or (os.typ = 'W' and not exists (select 1
                                              from stat.dgt_eksport_intr
                                             where ek_nip = dp.nip
                                               and ek_RokMc = @RokMc ))
         )
     and not exists (select 1
                       from stat.dot_struktura_priorytet_5_roczna sp5r
                      where sp5r.nip = obr.nip
                        and sp5r.typ = os.typ
                        and sp5r.rok = @RokMc/100 - 1)
     and case when @p_typ = 'P' then obr.sr_mies_stat_przywoz else obr.sr_mies_stat_wywoz end != 0
     and not exists (select 1 
                       from stat.dot_dekl_wynik_dok dok2 
                      where dok2.nip_zobowiazanego=obr.nip and dok2.typ=@p_typ and dok2.RokMc=@RokMc)
     and not exists (select 1 
                       from stat.dot_podmiot_dane_miesieczne dm 
                      where  dm.RokMc = @RokMcPop and dm.nip = dp.nip 
                       and ((@p_typ='P' and intr_zerowy_przywoz = 'T') or (@p_typ='W' and intr_zerowy_wywoz = 'T')))
     and exists (select 1 
                   from stat.dot_podmiot_dane_roczne dm 
                  where  dm.rok = @RokMcPop/100 and dm.nip = dp.nip 
                    and ((@p_typ='P' and ilosc_intrastat_przywoz >= @v_min_intr and ilosc_vat_przywoz >= @v_min_vat) or (@p_typ='W' and ilosc_intrastat_wywoz >= @v_min_intr and ilosc_vat_wywoz >= @v_min_vat)))
    -- Czy od początku roku nie było cały czas zerówek
      and not exists (select 1 from stat.dot_ciaglosc c where c.nip=dp.nip and c.rok=@RokMc/100 and 
              ((@p_typ='P' and (intr_zerowy_przywoz = 'T' or vat_zerowy_przywoz = 'T')) or (@p_typ='W' and (intr_zerowy_wywoz = 'T' or vat_zerowy_wywoz = 'T'))))

 --
  if isnull (@ilosc_rekordow, 0) > 0
  begin
    exec stat.DziennikWpisInfo 'start: dop_pierwszy_termin_powyzej_asymilacji - wstawienie dokumentów podmiotów, które nie mają struktury', @@PROCID;
    insert into #dot_dekl_wynik_dok
      select distinct '1111111111_' + os.typ + right ('00' + convert (varchar, @RokMc%100), 2) + right (convert (varchar, @RokMc/100), 2) id,
             'Y' as [status],
             '1111111111' nip,
             '11111111111111' regon,
             @p_typ typ,
			 dbo.KonwertujDateNaRokMc(@p_data_do) as RokMc,
             1 as numer
        from stat.dot_obroty_roczne obr,
             stat.dgv_kopia_intr_dane_pod dp,
             stat.dot_okres_sprawozd os,
             stat.dot_priorytet p
       where obr.nip = dp.nip
         and obr.rok = @RokMcPop/100
         and dp.id_pod = os.id_pod
         and dp.id_pod = p.id_pod
         and os.RokMc = @RokMc
		 and os.RokMc BETWEEN p.WaznaOdRokMc AND p.WaznaDoRokMc
         and os.[status] = 'N'
         and os.wsk_popraw = 'N'
         and os.typ = @p_typ
         and os.typ = p.rodzaj_prior
         and p.priorytet > 1
         and (    (os.typ = 'P' and not exists (select 1
                                                  from stat.dgt_import_intr
                                                 where im_nip = dp.nip
												   and im_RokMc = @RokMc))
               or (os.typ = 'W' and not exists (select 1
                                                  from stat.dgt_eksport_intr
                                                 where ek_nip = dp.nip
                                                   and ek_RokMc = @RokMc))
             )
         and not exists (select 1
                           from stat.dot_struktura_priorytet_5_roczna sp5r
                          where sp5r.nip = obr.nip
                            and sp5r.typ = os.typ
                            and sp5r.rok = @RokMcPop/100)
         and case when @p_typ = 'P' then obr.sr_mies_stat_przywoz else obr.sr_mies_stat_wywoz end != 0
         and not exists (select 1 
                           from stat.dot_dekl_wynik_dok dok2 
                          where dok2.nip_zobowiazanego=obr.nip and dok2.typ=@p_typ and dok2.RokMc=@RokMc)
         and not exists (select 1 
                           from stat.dot_podmiot_dane_miesieczne dm 
                          where  dm.RokMc = @RokMcPop and dm.nip = dp.nip 
                           and ((@p_typ='P' and intr_zerowy_przywoz = 'T') or (@p_typ='W' and intr_zerowy_wywoz = 'T')))
         and exists (select 1 
                       from stat.dot_podmiot_dane_roczne dm 
                      where  dm.rok = @RokMcPop/100 and dm.nip = dp.nip 
                        and ((@p_typ='P' and ilosc_intrastat_przywoz >= @v_min_intr and ilosc_vat_przywoz >= @v_min_vat) or (@p_typ='W' and ilosc_intrastat_wywoz >= @v_min_intr and ilosc_vat_wywoz >= @v_min_vat)))
      -- Czy od początku roku nie było cały czas zerówek
         and not exists (select 1 from stat.dot_ciaglosc c where c.nip=dp.nip and c.rok=@RokMc/100 and 
                        ((@p_typ='P' and (intr_zerowy_przywoz = 'T' or vat_zerowy_przywoz = 'T')) or (@p_typ='W' and (intr_zerowy_wywoz = 'T' or vat_zerowy_wywoz = 'T'))))
 
    -- pomocnicza tabela struktury - wyczyszczenie
    truncate table #struktura
    --
    select @v_polecenie = case when @p_typ = 'P' then @v_polecenie_im else @v_polecenie_ek end
    set @v_polecenie = replace (@v_polecenie, '@1', convert (varchar, @ilosc_rekordow))
    set @v_polecenie = replace (@v_polecenie, '@RokMc', convert (varchar, @RokMc))
    exec sys.sp_executesql @v_polecenie;
    --
    exec stat.DziennikWpisInfo 'start: dop_pierwszy_termin_powyzej_asymilacji - wstawienie pozycji dokumentów podmiotów, które nie mają struktury', @@PROCID;
----------------------------------------------------------    
select @v_suma = sum(sr_mies_stat)
        from  (select nip,
                     rok,
                     case when @p_typ = 'P' then sr_mies_stat_przywoz else sr_mies_stat_wywoz end sr_mies_stat
                from stat.dot_obroty_roczne
             ) obr,
             stat.dgv_kopia_intr_dane_pod dp,
             stat.dot_okres_sprawozd os,
             stat.dot_priorytet p
       where obr.nip = dp.nip
         and obr.rok = @RokMcPop/100
         and dp.id_pod = os.id_pod
         and dp.id_pod = p.id_pod
         and os.RokMc = @RokMc
		 and os.RokMc BETWEEN p.WaznaOdRokMc AND p.WaznaDoRokMc
         and os.[status] = 'N'
         and os.wsk_popraw = 'N'
         and os.typ = @p_typ
         and os.typ = p.rodzaj_prior
         and p.priorytet > 1
         and (    (os.typ = 'P' and not exists (select 1
                                                  from stat.dgt_import_intr
                                                 where im_nip = dp.nip
												   and im_RokMc = @RokMc))
               or (os.typ = 'W' and not exists (select 1
                                                  from stat.dgt_eksport_intr
                                                 where ek_nip = dp.nip
												   and ek_RokMc = @RokMc))
             )
         and not exists (select 1
                           from stat.dot_struktura_priorytet_5_roczna sp5r
                          where sp5r.nip = obr.nip
                            and sp5r.typ = os.typ
                            and sp5r.rok = @RokMcPop/100)
         and obr.sr_mies_stat != 0
         and not exists (select 1 
                           from stat.dot_dekl_wynik_dok dok2 
                          where dok2.nip_zobowiazanego=obr.nip and dok2.typ=@p_typ and dok2.RokMc = @RokMc)
         and not exists (select 1 
                           from stat.dot_podmiot_dane_miesieczne dm 
                          where  dm.RokMc = @RokMcPop and dm.nip = dp.nip 
                           and ((@p_typ='P' and intr_zerowy_przywoz = 'T') or (@p_typ='W' and intr_zerowy_wywoz = 'T')))
         and exists (select 1 
                       from stat.dot_podmiot_dane_roczne dm 
                      where  dm.rok = @RokMcPop/100 and dm.nip = dp.nip 
                        and ((@p_typ='P' and ilosc_intrastat_przywoz >= @v_min_intr and ilosc_vat_przywoz >= @v_min_vat) or (@p_typ='W' and ilosc_intrastat_wywoz >= @v_min_intr and ilosc_vat_wywoz >= @v_min_vat)))
      -- Czy od początku roku nie było cały czas zerówek
         and not exists (select 1 from stat.dot_ciaglosc c where c.nip=dp.nip and c.rok=@RokMc/100 and 
                        ((@p_typ='P' and (intr_zerowy_przywoz = 'T' or vat_zerowy_przywoz = 'T')) or (@p_typ='W' and (intr_zerowy_wywoz = 'T' or vat_zerowy_wywoz = 'T'))))

      -- 
insert into #dot_dekl_wynik_poz
   select '1111111111_' + @p_typ + right ('00' + convert (varchar, @RokMc%100), 2) + right (convert (varchar, @RokMc/100), 2) id,
             null pozid,
             'Y' status,
             null komentarz,
             null opis_towaru,
             sp5r.kraj_przezn_wysyl kraj_przezn_wysyl,
             null warunki_dostawy,
             sp5r.rodzaj_transakcji rodzaj_transakcji,
             null rodzaj_transportu,
             sp5r.kod_towarowy kod_towarowy,
             sp5r.kraj_pochodzenia kraj_pochodzenia,
             null masa_netto,
             null uzup_jm,
             (@v_suma * sp5r.udzial_w_obrotach) * case when @p_typ = 'P' then @v_wspolczynnik_k_p else @v_wspolczynnik_k_w end wartosc_faktury,
             (@v_suma * sp5r.udzial_w_obrotach) * case when @p_typ = 'P' then @v_wspolczynnik_k_p else @v_wspolczynnik_k_w end wartosc_statystyczna,
             '4' wsk_progowy,
             null
        from #struktura sp5r
       where sp5r.RokMc = @RokMc

  end
  --
  exec stat.DziennikWpisInfo 'dop_pierwszy_termin_powyzej_asymilacji przepisanie danych do struktury docelowej', @@PROCID;
  
  --
  -- Szacowanie masy i ilości na podstawie struktury globalnej
  --  
  --
  exec stat.DziennikWpisInfo 'start: dop_szacowanie_masy_i_liosci', @@PROCID;
  --
	select count(*), 'przed 11111' from #dot_dekl_wynik_poz where masa_netto is null;
  --
        exec stat.DziennikWpisInfo ' - szacowanie masy na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna b 
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
	exec stat.DziennikWpisInfo ' - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
        exec stat.DziennikWpisInfo ' - szacowanie masy na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))          
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_rodztran b, stat.dot_wspolczynnik_k c
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
	exec stat.DziennikWpisInfo ' - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
	--
        exec stat.DziennikWpisInfo ' - szacowanie masy na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))          
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_kraje b, stat.dot_wspolczynnik_k c
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
	--
        exec stat.DziennikWpisInfo ' - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))
         from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_kraje b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
        --
        exec stat.DziennikWpisInfo ' - szacowanie masy na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * 
                                    isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end 
                                               from stat.dot_wspolczynnik_k c
                                              where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                   else null end))          
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100-1 = b.rok
	--
        exec stat.DziennikWpisInfo ' - szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * 
                                   isnull ((select case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end 
                                             from stat.dot_wspolczynnik_k c
                                            where #dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy and a.RokMc = c.RokMc),1))
                                  else null end))
        from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100-1 = b.rok
        --
	--
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna b 
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
	exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna', @@PROCID;
        --        
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
  exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
	exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;
        --             
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and #dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
	--
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
          from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_rodztran b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
	--
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
        --                     
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
         from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_kraje b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc = b.RokMc
        --
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) masy na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
            set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_kilogram else null end))
         from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100 = b.rok
	--
        exec stat.DziennikWpisInfo ' - szacowanie (rok biezacy) ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
        --            
        update #dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then #dot_dekl_wynik_poz.wartosc_statystyczna / b.avg_cena_za_sztuke else null end))
         from #dot_dekl_wynik_dok a, stat.dot_struktura_miesieczna_agr_miesiac b
         where #dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and #dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100 = b.rok
        --
        exec stat.DziennikWpisInfo ' - koniec szacowania na podstawie struktury ubiegłorocznej', @@PROCID;
	select count(*), 'po 11111' from #dot_dekl_wynik_poz where masa_netto is null;
-- usunięcie pozycji które powinny mieć wypełnioną ilość w uzupełniającej jednostce miary a nie mają
	delete from #dot_dekl_wynik_poz
	where uzup_jm is null and 
		exists (select 1 from stat.tbl_sl_taryfa_cn8 
		where #dot_dekl_wynik_poz.kod_towarowy = tbl_sl_taryfa_cn8.kod_cn and
			tbl_sl_taryfa_cn8.nazwa_jm is not null)  

-- usunięcie nagłówków dokumentów które nie posiadają pozycji
	delete from #dot_dekl_wynik_dok
	where not exists (select 1 from #dot_dekl_wynik_poz where #dot_dekl_wynik_poz.id = #dot_dekl_wynik_dok.id)    

    -- przepisanie danych
    insert into stat.dot_dekl_wynik_dok 
         select * from #dot_dekl_wynik_dok
    insert into stat.dot_dekl_wynik_poz (id, pozid, status, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji, rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_faktury, wartosc_statystyczna, wskaznik_progowy, nr_grp)
         select id, pozid, status, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji, rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_faktury, wartosc_statystyczna, wskaznik_progowy, nr_grp
           from #dot_dekl_wynik_poz
  --
  --
  --
  drop table #struktura
  -- Grupowanie danych doszacownych gdy podano prog większy od zera

  if @p_prog > 0 
  begin
    if @p_typ = 'P' 
    begin
      exec [stat].dop_grupowanie_doszacowan @p_prog, @p_data_do, 'P', @v_wspolczynnik_k_p
    end
    else
    begin
      exec [stat].dop_grupowanie_doszacowan @p_prog, @p_data_do, 'W', @v_wspolczynnik_k_w
    end
  end
  print 'stop: dop_pierwszy_termin_powyzej_asymilacji'
  exec stat.DziennikWpisInfo 'stop: dop_pierwszy_termin_powyzej_asymilacji', @@PROCID;