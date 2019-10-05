CREATE PROCEDURE [stat].dop_powyzej_asymilacji 
    @p_data_do datetime
as
begin
    declare @v_typ varchar(1)
    declare @v_min_intr int
    declare @v_min_vat int
    declare @v_miesiac int
    declare @v_min_ciaglos int
    declare @v_i int
    declare @v_tekst varchar(1024)
    --declare @v_miesiac_str int
    --declare @v_rok_str int
    declare @v_wspolczynnik_f decimal(5,4)
    --
    set @v_typ='P'
    --set @v_rok=year(@p_data_do)
	declare @RokMc int = dbo.KonwertujDateNaRokMc(@p_data_do);
	declare @RokMcStru int;

    set @v_i=0
    --
    select @v_min_intr = isnull(convert(numeric,value),1) from stat.params where keyword='min_intr' and section='GEN';
    select @v_min_vat = isnull(convert(numeric,value),1) from stat.params where keyword='min_vat' and section='GEN';
    select @v_min_ciaglos = isnull(convert(numeric,value),1) from stat.params where keyword='min_ciaglosc' and section='GEN';
    if @v_min_ciaglos >= month(@p_data_do)
    begin
        set @v_min_ciaglos = month(@p_data_do) -1
    end 
    --
    set @v_tekst='start: min_intr: '+convert(varchar,@v_min_intr)+ ' min_vat: '+convert(varchar,@v_min_vat)+ ' data_do: '+convert(varchar,@p_data_do,120)
    --
    exec stat.DziennikWpisInfo @v_tekst, @@PROCID
    --
    exec stat.DziennikWpisInfo 'tworzenie indeksów', @@PROCID;
    --
    if not exists (select 1 from sys.sysindexes where name='idx_dot_struktura_miesieczna_nip')
    begin
        create index idx_dot_struktura_miesieczna_nip on stat.dot_struktura_miesieczna_nip(RokMc, typ, nip) on StatIndeksy;
    end
    if not exists (select 1 from sys.sysindexes where name='idx_dot_podmiot_dane_roczne')
    begin
        create index idx_dot_podmiot_dane_roczne on stat.dot_podmiot_dane_roczne(rok, nip) on StatIndeksy
    end
    if not exists (select 1 from sys.sysindexes where name='idx_dot_podmiot_dane_miesieczne')
    begin
        create index idx_dot_podmiot_dane_miesieczne on stat.dot_podmiot_dane_miesieczne(RokMc, nip) on StatIndeksy
    end
    if not exists (select 1 from sys.sysindexes where name='idx_dot_obroty_roczne')
    begin
        create index idx_dot_obroty_roczne on stat.dot_obroty_roczne(rok, nip) on StatIndeksy
    end
    -- uzupełnieni tabeli z ciagłoscią danych
    truncate table stat.dot_ciaglosc;
    --
    insert into stat.dot_ciaglosc
    select nip,
       RokMc/100 as rok, 
       case when sum(case when intr_zerowy_przywoz='T' then 1 else 0 end) = @v_min_ciaglos then 'T' else 'N' end intr_zerowy_przywoz,
       case when sum(case when intr_zerowy_wywoz='T' then 1 else 0 end) = @v_min_ciaglos then 'T' else 'N' end intr_zerowy_wywoz,
       case when sum(case when vat_zerowy_przywoz='T' then 1 else 0 end) = @v_min_ciaglos then 'T' else 'N' end vat_zerowy_przywoz,
       case when sum(case when vat_zerowy_wywoz='T' then 1 else 0 end) = @v_min_ciaglos then 'T' else 'N' end vat_zerowy_wywoz
    from stat.dot_podmiot_dane_miesieczne
    where RokMc <= dbo.KonwertujMiRNaRokMc(@v_min_ciaglos, @RokMc/100)
    group by nip, RokMc/100
    --
    -- Pętla po typach
    while(@v_i<2)
        begin
        set @v_miesiac=0
        if(@v_i=1) 
            begin
                set @v_typ='W'
            end
            set @v_i=@v_i+1
    
            while(@v_miesiac < month(@p_data_do))
            begin
            set @v_miesiac=@v_miesiac+1
            --odczyt współczynnika F
            select @v_wspolczynnik_f=f from stat.dot_wspolczynnik_f where typ=@v_typ and RokMc = @RokMc
            --
            set @v_tekst='dop_powyżej_asymilacji strukturu ubiegłoroczna @v_typ: ' + @v_typ + ' @v_miesiac ' + convert(varchar,@v_miesiac)
            --
            exec stat.DziennikWpisInfo @v_tekst, @@PROCID
            --    
            insert into dot_dekl_wynik_dok 
                 select dp.id_pod + '_(1)_' + os.typ + dbo.KonwertujOkresNaMMYY(@RokMc) as id,
                        'Y' status,
                        obr.nip,
                        dp.regon,
                        @v_typ typ,
                        @RokMc RokMc,
                        1 as numer
                   from stat.dot_obroty_roczne obr,
                        dgv_kopia_intr_dane_pod dp,
                        dot_okres_sprawozd os,
                        dot_priorytet p
                  where obr.nip = dp.nip 
                    and obr.rok = @RokMc/100 - 1
                    and dp.id_pod = os.id_pod
                    and dp.id_pod = p.id_pod
                    and os.RokMc = @RokMc
					and os.RokMc BETWEEN p.WaznaOdRokMc AND p.WaznaDoRokMc
                    and os.status = 'N'
                    and os.wsk_popraw = 'N'
                    and os.typ = @v_typ
                    and os.typ = p.rodzaj_prior
                    and p.priorytet > 1
                -- Nie ma w deklaracji rzeczywistych
                    and ((os.typ = 'P' and not exists (select 1
                                                         from dgt_import_intr
                                                        where im_nip = dp.nip
														  and im_RokMc = @RokMc ))
                      or (os.typ = 'W' and not exists (select 1
                                                         from dgt_eksport_intr
                                                        where ek_nip = dp.nip
														  and ek_RokMc = @RokMc)) )
                  -- Jest w strukturze ubiegłorocznej
                     and exists (select 1 
                                   from stat.dot_struktura_miesieczna_nip str 
                                  where str.RokMc = @RokMc - 100
                                   and str.typ= os.typ                                    and str.nip = dp.nip
                                   and str.udzial_pozycji > 0)
                 -- Nie było zerówek
                   and not exists (select 1 
                                     from stat.dot_podmiot_dane_miesieczne dm 
                                    where  dm.RokMc = @RokMc - 100 and dm.nip = dp.nip 
                                     and ((@v_typ='P' and intr_zerowy_przywoz = 'T') or (@v_typ='W' and intr_zerowy_wywoz = 'T')))
                  -- Była odpowiednia minimalna ilość deklaracji vat i intrastat
                    and exists (select 1 
                                  from stat.dot_podmiot_dane_roczne dm 
                                 where  dm.rok = @RokMc/100 - 1 and dm.nip = dp.nip 
                                  and ((@v_typ='P' and ilosc_intrastat_przywoz >= @v_min_intr) or (@v_typ='W' and ilosc_intrastat_wywoz >= @v_min_intr)))
                   -- Czy od początku roku nie było cały czas zerówek
                 and not exists (select 1 from stat.dot_ciaglosc c where c.nip=dp.nip and c.rok=@RokMc/100 and 
                                ((@v_typ='P' and (intr_zerowy_przywoz = 'T' or vat_zerowy_przywoz = 'T')) or (@v_typ='W' and (intr_zerowy_wywoz = 'T' or vat_zerowy_wywoz = 'T'))))


            --
            insert into stat.dot_dekl_wynik_poz
            select dp.id_pod + '_(1)_' + os.typ + dbo.KonwertujOkresNaMMYY(@RokMc) as id,
                   null pozid,
                   'Y' status,
                   null komentarz,
                   null opis_towaru,
                   str.kraj_przezn_wysyl kraj_przezn_wysyl,
                   null warunki_dostawy,
                   str.rodzaj_transakcji rodzaj_transakcji,
                   null rodzaj_transportu,
                   str.kod_towarowy kod_towarowy,
                   str.kraj_pochodzenia kraj_pochodzenia,
                   null masa_netto,
                   null uzup_jm,
                   str.wartosc_faktury*mies_k.wspolczynnik_K wartosc_faktury,
                   str.wartosc_stat*mies_k.wspolczynnik_K wartosc_statystyczna,
                   '4' wsk_progowy,
                   null
              from stat.dgv_kopia_intr_dane_pod dp,
                   stat.dot_okres_sprawozd os,
                   stat.dot_priorytet p,
                   stat.dot_struktura_miesieczna_nip str,
                    (select RokMc,
                            case when @v_typ = 'P' then wspolczynnik_K_przywoz  else wspolczynnik_K_wywoz end wspolczynnik_K
                      from stat.dot_mies_wspolczynnik_k) mies_k
              where mies_k.RokMc = @RokMc
                and dp.id_pod = os.id_pod
                and dp.id_pod = p.id_pod
                and str.RokMc= @RokMc-100
                and str.typ=  os.typ
                and str.nip = dp.nip
                and str.udzial_pozycji > 0
                and os.RokMc = @RokMc
				and os.RokMc BETWEEN p.WaznaOdRokMc AND p.WaznaDoRokMc
                and os.status = 'N'
                and os.wsk_popraw = 'N'
                and os.typ = @v_typ
                and os.typ = p.rodzaj_prior
                and p.priorytet > 1
                -- Dla deklaracji których nagłówki zostały wstawione w poprzednim kroku
                -- Nie ma w deklaracji rzeczywistych
                and ((os.typ = 'P' and not exists (select 1
                                                     from dgt_import_intr
                                                    where im_nip = dp.nip
													  and im_RokMc = @RokMc))
                  or (os.typ = 'W' and not exists (select 1
                                                     from dgt_eksport_intr
                                                    where ek_nip = dp.nip
													  and ek_RokMc = @RokMc )) )
             -- Jest w strukturze ubiegłorocznej
                and exists (select 1 
                              from stat.dot_struktura_miesieczna_nip str 
                             where str.RokMc = @RokMc-100
                               and str.typ= os.typ
                               and str.nip = dp.nip
                               and str.udzial_pozycji > 0)
             -- Nie było zerówek
                and not exists (select 1 
                                  from stat.dot_podmiot_dane_miesieczne dm 
                                 where  dm.RokMc = @RokMc-100 and dm.nip = dp.nip 
                                   and ((@v_typ='P' and intr_zerowy_przywoz = 'T') or (@v_typ='W' and intr_zerowy_wywoz = 'T')))
              -- Była odpowiednia minimalna ilość deklaracji vat i intrastat
                and exists (select 1 
                              from stat.dot_podmiot_dane_roczne dm 
                             where  dm.rok = @RokMc/100 - 1 and dm.nip = dp.nip 
                               and ((@v_typ='P' and ilosc_intrastat_przywoz >= @v_min_intr) or (@v_typ='W' and ilosc_intrastat_wywoz >= @v_min_intr)))     
              -- Czy od początku roku nie było cały czas zerówek
                and not exists (select 1 from stat.dot_ciaglosc c where c.nip=dp.nip and c.rok=@RokMc/100 and 
                                ((@v_typ='P' and (intr_zerowy_przywoz = 'T' or vat_zerowy_przywoz = 'T')) or (@v_typ='W' and (intr_zerowy_wywoz = 'T' or vat_zerowy_wywoz = 'T'))))

             end   
         end

        --
        exec stat.DziennikWpisInfo 'dop_powyżej_asymilacji szacowanie masy i ilości na podstawie dot_struktura_miesieczna_nip'
        --
        update dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when str.avg_cena_za_kilogram > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (str.avg_cena_za_kilogram * (case when dok.typ = 'P' then wspolczynnik_Kcnkg_przywoz else wspolczynnik_Kcnkg_wywoz end)) else null end)),
               uzup_jm = convert(numeric(11,0),(case when str.avg_cena_za_sztuke > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (str.avg_cena_za_sztuke * (case when dok.typ = 'P' then wspolczynnik_Kcnj_przywoz else wspolczynnik_Kcnj_wywoz end)) else null end)) 
          from stat.dot_dekl_wynik_dok dok, dot_struktura_miesieczna_nip str, dot_wspolczynnik_k as k
         where dot_dekl_wynik_poz.id = dok.id
           and dot_dekl_wynik_poz.kraj_przezn_wysyl = str.kraj_przezn_wysyl
           and dot_dekl_wynik_poz.kraj_pochodzenia = str.kraj_pochodzenia
           and dot_dekl_wynik_poz.rodzaj_transakcji = str.rodzaj_transakcji
           and dot_dekl_wynik_poz.kod_towarowy = str.kod_towarowy
           and dok.nip_zobowiazanego = str.nip
           and dok.typ = str.typ
           and dok.RokMc-100 = str.RokMc
           and dot_dekl_wynik_poz.kod_towarowy = k.kod_towarowy
           and dok.RokMc = k.RokMc
        --
        exec stat.DziennikWpisInfo 'dop_powyzej_asymilacji szacowanie masy na podstawie dot_struktura_miesieczna'
        --        
        update dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * (case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end)) else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna b, dot_wspolczynnik_k c
         where dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
           and dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy
           and a.RokMc = c.RokMc
        --
	exec stat.DziennikWpisInfo 'dop_powyzej_asymilacji szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna'
        --        
        update dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * (case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end)) else null end)) 
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna b, dot_wspolczynnik_k c
         where dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and dot_dekl_wynik_poz.rodzaj_transakcji = b.rodzaj_transakcji
           and dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
           and dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy
           and a.RokMc = c.RokMc
        --
        exec stat.DziennikWpisInfo 'dop_powyżej_asymilacji szacowanie masy na podstawie dot_struktura_miesieczna_agr_rodztran'
        --             
        update dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * (case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end)) else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_rodztran b, dot_wspolczynnik_k c
         where dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
           and dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy
           and a.RokMc = c.RokMc
        --
	exec stat.DziennikWpisInfo 'dop_powyżej_asymilacji szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_rodztran'
        --             
        update dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * (case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end)) else null end)) 
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_rodztran b, dot_wspolczynnik_k c
         where dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and dot_dekl_wynik_poz.kraj_przezn_wysyl = b.kraj_przezn_wysyl
           and dot_dekl_wynik_poz.kraj_pochodzenia = b.kraj_pochodzenia
           and dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
           and dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy
           and a.RokMc = c.RokMc
	--
        exec stat.DziennikWpisInfo 'dop_powyżej_asymilacji szacowanie masy na podstawie dot_struktura_miesieczna_agr_kraje'
        --                     
        update dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * (case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end)) else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_kraje b, dot_wspolczynnik_k c
         where dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
           and dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy
           and a.RokMc = c.RokMc
	--
        exec stat.DziennikWpisInfo 'dop_powyżej_asymilacji szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_kraje'
        --                     
        update dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * (case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end)) else null end)) 
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_kraje b, dot_wspolczynnik_k c
         where dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc-100 = b.RokMc
           and dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy
           and a.RokMc = c.RokMc
        --
        exec stat.DziennikWpisInfo 'dop_powyżej_asymilacji szacowanie masy na podstawie dot_struktura_miesieczna_agr_miesiac'
        --            
        update dot_dekl_wynik_poz
           set masa_netto = convert(numeric(11,0),(case when b.avg_cena_za_kilogram > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_kilogram * (case when a.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end)) else null end))
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_miesiac b, dot_wspolczynnik_k c
         where dot_dekl_wynik_poz.id = a.id
           and masa_netto is null 
           and dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100-1 = b.rok
           and dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy
           and a.RokMc = c.RokMc
	--
        exec stat.DziennikWpisInfo 'dop_powyżej_asymilacji szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_miesiac'
        --            
        update dot_dekl_wynik_poz
           set uzup_jm = convert(numeric(11,0),(case when b.avg_cena_za_sztuke > 0 then dot_dekl_wynik_poz.wartosc_statystyczna / (b.avg_cena_za_sztuke * (case when a.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end)) else null end)) 
          from stat.dot_dekl_wynik_dok a, dot_struktura_miesieczna_agr_miesiac b, dot_wspolczynnik_k c
         where dot_dekl_wynik_poz.id = a.id
           and uzup_jm is null
           and dot_dekl_wynik_poz.kod_towarowy = b.kod_towarowy
           and a.typ = b.typ
           and a.RokMc/100-1 = b.rok
           and dot_dekl_wynik_poz.kod_towarowy = c.kod_towarowy
           and a.RokMc = c.RokMc			--TODOKN: To jest dobrze??
        --
        exec stat.DziennikWpisInfo 'dop_powyżej_asymilacji koniec szacowania na podstawie struktury ubiegłorocznej'

-- usunięcie pozycji które powinny mieć wypełnioną ilość w uzupełniającej jednostce miary a nie mają
	delete from stat.dot_dekl_wynik_poz
	where uzup_jm is null and 
		exists (select 1 from tbl_sl_taryfa_cn8 
		where dot_dekl_wynik_poz.kod_towarowy = tbl_sl_taryfa_cn8.kod_cn and
			tbl_sl_taryfa_cn8.nazwa_jm is not null)  

-- usunięcie nagłówków dokumentów które nie posiadają pozycji
	delete from stat.dot_dekl_wynik_dok
	where not exists (select 1 from stat.dot_dekl_wynik_poz where dot_dekl_wynik_poz.id = dot_dekl_wynik_dok.id)        

        -- szacowanie deklaracji na podstawie okresów poprzednich tego samego roku.
        set @v_i=0
        set @v_typ='P'
        select * into #dot_dekl_wynik_dok from stat.dot_dekl_wynik_dok where 1=2
        select * into #dot_dekl_wynik_poz from stat.dot_dekl_wynik_poz where 1=2
        while(@v_i<2)
            begin
            set @v_miesiac=0
            if(@v_i=1) 
                begin
                    set @v_typ='W'
                end
                set @v_i=@v_i+1
        
                while(@v_miesiac < month(@p_data_do))
                begin
                --odczyt współczynnika F
                select @v_wspolczynnik_f=f from stat.dot_wspolczynnik_f where typ=@v_typ and RokMc=@RokMc
                --
                set @v_miesiac=@v_miesiac+1
                --
                set @v_tekst='dop_powyżej_asymilacji strukturu bieżąca @v_typ: ' + @v_typ + ' @v_miesiac ' + convert(varchar,@v_miesiac)
                exec stat.DziennikWpisInfo  @v_tekst  
                --
                -- Ustawienie miesiąca do wyszukiwania struktury
                --
                if @v_miesiac=1
                begin
					set @RokMcStru = dbo.KonwertujMiRNaRokMc(12, @RokMc/100-1);
                end
                else
                begin
					set @RokMcStru = @RokMc-1;
                end
                --
                -- Wstawianie danych na podstawie struktury bieżacej
                --  
                insert into #dot_dekl_wynik_dok 
                     select dp.id_pod + '_(2)_' + os.typ + right ('00' + convert (varchar, @RokMc%100), 2) + right (convert (varchar, @RokMc/100), 2) id,
                            'Y' status,
                            obr.nip,
                            dp.regon,
                            @v_typ typ,
                            @RokMc RokMc,
                            1 numer
                       from stat.dot_obroty_roczne obr,
                            dgv_kopia_intr_dane_pod dp,
                            dot_okres_sprawozd os,
                            dot_priorytet p
                      where obr.nip = dp.nip
                        and obr.rok = @RokMc/100 - 1
                        and dp.id_pod = os.id_pod
                        and dp.id_pod = p.id_pod
						and os.RokMc = @RokMc
						and os.RokMc BETWEEN p.WaznaOdRokMc AND p.WaznaDoRokMc
                        and os.[status] = 'N'
                        and os.wsk_popraw = 'N'
                        and os.typ = @v_typ
                        and os.typ = p.rodzaj_prior
                        and p.priorytet > 1
                        and (    (os.typ = 'P' and not exists (select 1
                                                                 from dgt_import_intr
                                                                where im_nip = dp.nip
                                                                  and RokMc = @RokMc ) )
                              or (os.typ = 'W' and not exists (select 1
                                                                 from dgt_eksport_intr
                                                                where ek_nip = dp.nip
																  and RokMc = @RokMc ) )
															)
                        and not exists (select 1 
                                          from stat.dot_dekl_wynik_dok dok2 
                                         where dok2.nip_zobowiazanego=obr.nip and dok2.typ=@v_typ and dok2.RokMc = @RokMc)
                        and exists (select 1 
                                      from stat.dot_struktura_miesieczna_nip as [str]
                                     where [str].RokMc= @RokMcStru
                                       and [str].typ = os.typ
                                       and [str].nip = dp.nip
                                       and [str].udzial_pozycji > 0)
                        and not exists (select 1 
                                          from stat.dot_podmiot_dane_miesieczne dm 
                                         where  dm.RokMc = @RokMc-100 and dm.nip = dp.nip 
                                          and ((@v_typ='P' and intr_zerowy_przywoz = 'T') or (@v_typ='W' and intr_zerowy_wywoz = 'T')))
                        and exists (select 1 
                                      from stat.dot_podmiot_dane_roczne dm 
                                     where  dm.rok = @RokMc/100-1 and dm.nip = dp.nip 
                                       and ((@v_typ='P' and ilosc_intrastat_przywoz >= @v_min_intr and ilosc_vat_przywoz >= @v_min_vat) or (@v_typ='W' and ilosc_intrastat_wywoz >= @v_min_intr and ilosc_vat_wywoz >= @v_min_vat)))
                      -- Czy od początku roku nie było cały czas zerówek
                        and not exists (select 1 from stat.dot_ciaglosc c where c.nip=dp.nip and c.rok=@RokMc/100 and 
                                         ((@v_typ='P' and (intr_zerowy_przywoz = 'T' or vat_zerowy_przywoz = 'T')) or (@v_typ='W' and (intr_zerowy_wywoz = 'T' or vat_zerowy_wywoz = 'T'))))

                --
                insert into #dot_dekl_wynik_poz
                     select dp.id_pod + '_(2)_' + os.typ + right ('00' + convert (varchar, @RokMc%100), 2) + right (convert (varchar, @RokMc/100), 2) id,
                            null pozid,
                            'Y' status,
                            null komentarz,
                            null opis_towaru,
                            str.kraj_przezn_wysyl kraj_przezn_wysyl,
                            null warunki_dostawy,
                            str.rodzaj_transakcji rodzaj_transakcji,
                            null rodzaj_transportu,
                            str.kod_towarowy kod_towarowy,
                            str.kraj_pochodzenia kraj_pochodzenia,
                            str.sum_masa_netto masa_netto,
                            str.sum_uzup_jm uzup_jm,
                            str.wartosc_faktury wartosc_faktury,
                            str.wartosc_stat wartosc_statystyczna,
                            '4' wsk_progowy,
                            null
                       from stat.dgv_kopia_intr_dane_pod dp,
                            dot_okres_sprawozd os,
                            dot_priorytet p,
                            dot_struktura_miesieczna_nip str
                      where dp.id_pod = os.id_pod
                        and dp.id_pod = p.id_pod
                        and str.RokMc = @RokMcStru
                        and str.typ=  os.typ
                        and str.nip = dp.nip
                        and str.udzial_pozycji > 0
                        and os.RokMc = @RokMc
						and os.RokMc BETWEEN p.WaznaOdRokMc and p.WaznaDoRokMc
                        and os.status = 'N'
                        and os.wsk_popraw = 'N'
                        and os.typ = @v_typ
                        and os.typ = p.rodzaj_prior
                        and p.priorytet > 1
                        and exists (select 1 
                                      from #dot_dekl_wynik_dok dok2 
                                     where dok2.nip_zobowiazanego=dp.nip and dok2.typ=@v_typ and dok2.RokMc=@RokMc)
            
         end    
     end
    --
    select @v_tekst= 'dop_powyżej_asymilacji przepisanie danych do struktury docelowej '+ convert(varchar,count(*)) from stat.dot_dekl_wynik_poz where id like '%(_)%'
    exec stat.DziennikWpisInfo @v_tekst, @@PROCID

-- usunięcie pozycji które powinny mieć wypełnioną ilość w uzupełniającej jednostce miary a nie mają
	delete from #dot_dekl_wynik_poz
	where uzup_jm is null and 
		exists (select 1 from tbl_sl_taryfa_cn8 
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
    select @v_tekst= 'koniec: '+ convert(varchar,count(*)) from stat.dot_dekl_wynik_poz where id like '%(_)%'
    exec stat.DziennikWpisInfo @v_tekst, @@PROCID
    --

end