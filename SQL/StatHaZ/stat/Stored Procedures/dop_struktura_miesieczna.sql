
-- Dolozyc wyciganie danych na podstawie danych po genereacji zbioru.

CREATE PROCEDURE [stat].dop_struktura_miesieczna
@p_rok int = 2012, 
@p_generacja int = 0,
@p_nadpisz char(1) = 'N',
@p_zbior_roczny char(1) = 'T'
as
begin
    declare @v_rok int
    declare @v_tekst varchar(1024)
	declare @RokMcOd int
	declare @RokMcDo int
	declare @generacjaId int;

    set @v_tekst = 'start: @p_rok='+convert(varchar(4),@p_rok)+', @p_generacja='+convert(varchar(9),@p_generacja)+', @p_nadpisz='+@p_nadpisz+', @p_zbior_roczny='+@p_zbior_roczny

	declare @id bigint;
    exec @id = [stat].[DziennikWpisInfo] @v_tekst, @@PROCID;

	select @v_rok = rok from (select top 1 rok from stat.dot_podmiot_dane_roczne where rok = @p_rok) as x
	if @v_rok=@p_rok and @p_nadpisz<>'T'
	begin
	select @v_tekst='Dla roku '+convert(varchar(4),@p_rok)+' struktura już jest wygenerowana. W celu nadpisania danych należy ustawić parametr @p_nadpisz na "T" '
		Raiserror(@v_tekst,16,1)
        return
	end

    exec [stat].[DziennikWpisInfo] 'Wyłączanie indeksów...', @@PROCID, 1
	ALTER INDEX ALL ON stat.[dot_struktura_miesieczna_nip] DISABLE;
	ALTER INDEX ALL ON stat.[dot_podmiot_dane_roczne] DISABLE;
	ALTER INDEX ALL ON stat.[dot_podmiot_dane_miesieczne] DISABLE;
	ALTER INDEX ALL ON stat.[dot_obroty_roczne] DISABLE;

	TRUNCATE TABLE tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran;

	EXEC [stat].[DziennikWpisInfo] 'Wybór pozycji', @@PROCID, 1

    --
    if @p_zbior_roczny ='N'
	BEGIN
        insert into tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
        select 	nip_zobowiazanego, 
        	RokMc, 
        	kod_towarowy, 
        	kraj_pochodzenia,
        	kraj_przezn_wysyl, 	
        	1 ile_poz, 
        	isnull(rodzaj_transakcji,''),
        	typ,
        	wartosc_faktury,
            isnull(wartosc_stat,wartosc_faktury*(select f from stat.dot_wspolczynnik_f where RokMc = d.RokMc and typ = d.typ )),
        	masa_netto,
        	uzup_jm,
        	convert(numeric(21,6),case when masa_netto > 0 then wartosc_faktury/masa_netto else null end) cena_za_kilogram,
        	convert(numeric(21,6),case when uzup_jm > 0 then wartosc_faktury/uzup_jm else null end) cena_za_sztuke	 
           from stat.dgv_kopia_istat_dekl_wynik_dok d, 
				stat.dot_dekl_wynik_poz_nowa_wartosc_stat p
          where d.id_dok = p.id_dok and d.[Status] != 'U' and p.[Status] = 'Y' and RokMc BETWEEN @p_rok*100+1 AND @p_rok*100+12
	END ELSE BEGIN
		set @RokMcOd = @p_rok * 100 + 1;
		set @RokMcDo = @p_rok * 100 + 12;
		IF (@p_generacja < 1)
		BEGIN
			exec [stat].[DziennikWpisInfo] 'Wybór pozycji - określenie numeru generacji', @@PROCID, 1

			select @generacjaId = max(generacjaId) from stat.dgt_kopia_dgt_eksport_intr_agr 
				where generacjaId / 1000 = @RokMcDo and ek_znacznik_kategorii_progowej = 1;
		END ELSE BEGIN
			SET @generacjaId = (@p_rok * 100 + 12) * 1000 + @p_generacja;
		END

		IF @generacjaId IS NULL BEGIN
			EXEC [stat].[DziennikWpis]  'E', 'Nie ustalono parametru GeneracjaId. Przerwanie procedury.', @@PROCID
			RAISERROR('Nie ustalono parametru GeneracjaId', 16, 1);
			RETURN -1;
		END ELSE BEGIN
			set @v_tekst = 'Wybór pozycji - określenie numeru generacji. GeneracjaId = ' + cast(@generacjaId as varchar(9));
			exec [stat].[DziennikWpisInfo] @v_tekst, @@PROCID, 1
	  END

        --
        exec [stat].[DziennikWpisInfo] 'Wybór pozycji zbior roczny import', @@PROCID, 1
        insert into tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
        select im_nip	nip_zobowiazanego, 
        	im_RokMc,
        	im_pcn kod_towarowy, 
        	im_kraj_pochodzenia kraj_pochodzenia,
        	im_kraj_wysylki kraj_przezn_wysyl, 	
        	1 ile_poz, 
        	im_rodzaj_transakcji rodzaj_transakcji,
        	'P' typ,
        	im_wartosc_faktury as wartosc_faktury,
            im_wartosc_stat_zl as wartosc_stat,
        	im_masa_netto as      masa_netto,
        	im_ilosc as           uzup_jm,
        	case when im_masa_netto > 0 then im_wartosc_stat_zl / im_masa_netto else null end as cena_za_kilogram,
        	case when im_ilosc > 0 then im_wartosc_stat_zl / im_ilosc else null end as cena_za_sztuke	 
          from stat.dgt_kopia_dgt_import_intr_agr 
         where generacjaId = @generacjaId and im_znacznik_kategorii_progowej='1'
        --
        exec [stat].[DziennikWpisInfo] 'Wybór pozycji zbior roczny eksport', @@PROCID, 1
        --
        insert into tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
        select ek_nip	nip_zobowiazanego, 
        	ek_RokMc,
        	ek_pcn kod_towarowy, 
        	null kraj_pochodzenia,
        	ek_kraj_przeznaczenia kraj_przezn_wysyl, 	
        	1 ile_poz, 
        	ek_rodzaj_transakcji rodzaj_transakcji,
        	'W' typ,
        	ek_wartosc_faktury as wartosc_faktury,
            ek_wartosc_stat_zl as wartosc_stat,
        	ek_masa_netto as masa_netto,
        	ek_ilosc as uzup_jm,
        	case when ek_masa_netto > 0 then ek_wartosc_stat_zl/ek_masa_netto else null end cena_za_kilogram,
        	case when ek_ilosc > 0 then ek_wartosc_stat_zl/ek_ilosc else null end cena_za_sztuke	 
          from stat.dgt_kopia_dgt_eksport_intr_agr 
         where generacjaId = @generacjaId and ek_znacznik_kategorii_progowej = '1'

	exec [stat].dop_przygotuj_mapowanie_cn @p_rok, @generacjaId;

--	exec [stat].dop_mapuj_cn @p_rok
	
	update tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
	set kod_towarowy=nowy_cn
	from tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran s, 
		 stat.dot_mapowanie_cn c
	where s.kod_towarowy=c.stary_cn and c.rok = s.RokMc / 100

    end    

    --  
    exec [stat].[DziennikWpisInfo] 'Wyliczanie sum dla okresów', @@PROCID, 1

    TRUNCATE TABLE [tmp].[struktura_towarowa_suma_pozycji];
    INSERT INTO [tmp].[struktura_towarowa_suma_pozycji]
    select  typ,
    	nip_zobowiazanego, 
    	RokMc, 
    	sum(wartosc_stat) suma_pozycji
    from tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
    group by typ, nip_zobowiazanego, RokMc;
    
    EXEC [stat].[DziennikWpisInfo] 'Przebudowa (aktywacja) indeksów pomocniczych', @@PROCID, 1
	ALTER INDEX ALL ON tmp.struktura_towarowa_suma_pozycji REBUILD;
	ALTER INDEX ALL ON tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran REBUILD;

    --
    if (@p_nadpisz='T')
    begin
	    exec [stat].[DziennikWpisInfo] 'Usuwanie poprzednich danych...', @@PROCID, 1
        delete stat.dot_struktura_miesieczna_nip			where RokMc BETWEEN @p_rok*100+1 AND @p_rok*100+12;
        delete stat.dot_struktura_miesieczna				where RokMc BETWEEN @p_rok*100+1 AND @p_rok*100+12;
        delete stat.dot_struktura_miesieczna_agr_rodztran	where RokMc BETWEEN @p_rok*100+1 AND @p_rok*100+12;
        delete stat.dot_struktura_miesieczna_agr_kraje		where RokMc BETWEEN @p_rok*100+1 AND @p_rok*100+12;
        delete stat.dot_struktura_miesieczna_agr_miesiac	where rok = @p_rok;
        delete stat.dot_podmiot_dane_roczne					where rok = @p_rok;
        delete stat.dot_podmiot_dane_miesieczne				where RokMc BETWEEN @p_rok*100+1 AND @p_rok*100+12;
    end
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [dot_struktura_miesieczna_nip]', @@PROCID, 1
    --    
    INSERT INTO stat.dot_struktura_miesieczna_nip
    select  
     s.typ,
    	s.nip_zobowiazanego, 
    	s.RokMc, 
    	s.kod_towarowy,
    	s.kraj_pochodzenia, 
    	s.kraj_przezn_wysyl,
    	s.rodzaj_transakcji,
    	sum(s.ile_poz) ile_poz,
    	sum(s.wartosc_faktury) wartosc_faktury,
        sum(s.wartosc_stat) wartosc_stat,
    	sum(s.masa_netto) sum_masa_netto,
    	sum(s.uzup_jm) sum_uzup_jm,
        isnull(sum(s.wartosc_stat) / sum(sm.suma_pozycji), 0) as udzial_pozycji,
    	min (s.cena_za_kilogram) min_cena_za_kilogram,
    	max (s.cena_za_kilogram) as max_cena_za_kilogram,
    	avg(s.cena_za_kilogram) as avg_cena_za_kilogram,
    	stdev(s.cena_za_kilogram) as stdev_cena_za_kilogram,
    	min (s.cena_za_sztuke) min_cena_za_sztuke,
    	max (s.cena_za_sztuke) max_cena_za_sztuke,
    	avg(s.cena_za_sztuke) avg_cena_za_sztuke,
    	stdev(s.cena_za_sztuke) stdev_cena_za_sztuke
    from tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran s
    left join [tmp].[struktura_towarowa_suma_pozycji] sm ON s.typ = sm.typ 
												    and s.nip_zobowiazanego = sm.nip_zobowiazanego 
												    and s.RokMc = sm.RokMc
												    and sm.suma_pozycji > 0 
    group by s.typ, s.nip_zobowiazanego, s.RokMc, s.kod_towarowy, s.kraj_pochodzenia, s.kraj_przezn_wysyl, s.rodzaj_transakcji
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [dot_struktura_miesieczna]', @@PROCID, 1
    --
    insert into stat.dot_struktura_miesieczna
    select  typ,
    	RokMc, 
    	kod_towarowy,
    	kraj_pochodzenia, 
    	kraj_przezn_wysyl,
    	rodzaj_transakcji,
    	sum(ile_poz) ile_poz,
    	sum(wartosc_faktury) wartosc_faktury,
    	min (cena_za_kilogram) min_cena_za_kilogram,
    	max (cena_za_kilogram) as max_cena_za_kilogram,
    	avg (cena_za_kilogram) as avg_cena_za_kilogram,
    	stdev (cena_za_kilogram) as stdev_cena_za_kilogram,
    	min (cena_za_sztuke) min_cena_za_sztuke,
    	max (cena_za_sztuke) max_cena_za_sztuke,
    	avg (cena_za_sztuke) avg_cena_za_sztuke,
    	stdev (cena_za_sztuke) stdev_cena_za_sztuke
      from  tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
    group by RokMc, typ, kod_towarowy, kraj_pochodzenia, kraj_przezn_wysyl, rodzaj_transakcji
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [dot_struktura_miesieczna_agr_rodztran]', @@PROCID, 1
    --
    insert into stat.dot_struktura_miesieczna_agr_rodztran
    select  typ,
    	RokMc, 
    	kod_towarowy,
    	kraj_pochodzenia, 
    	kraj_przezn_wysyl,
    	sum(ile_poz) ile_poz,
    	sum(wartosc_faktury) wartosc_faktury,
    	min (cena_za_kilogram) min_cena_za_kilogram,
    	max (cena_za_kilogram) as max_cena_za_kilogram,
    	avg (cena_za_kilogram) as avg_cena_za_kilogram,
    	stdev (cena_za_kilogram) as stdev_cena_za_kilogram,
    	min (cena_za_sztuke) min_cena_za_sztuke,
    	max (cena_za_sztuke) max_cena_za_sztuke,
    	avg (cena_za_sztuke) avg_cena_za_sztuke,
    	stdev (cena_za_sztuke) stdev_cena_za_sztuke
      from  tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
    group by RokMc, typ, kod_towarowy, kraj_pochodzenia, kraj_przezn_wysyl
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [dot_struktura_miesieczna_agr_kraje]', @@PROCID, 1
    --
    insert into stat.dot_struktura_miesieczna_agr_kraje
    select  typ,
    	RokMc, 
    	kod_towarowy,
    	sum(ile_poz) ile_poz,
    	sum(wartosc_faktury) wartosc_faktury,
    	min (cena_za_kilogram) min_cena_za_kilogram,
    	max (cena_za_kilogram) as max_cena_za_kilogram,
    	avg (cena_za_kilogram) as avg_cena_za_kilogram,
    	stdev (cena_za_kilogram) as stdev_cena_za_kilogram,
    	min (cena_za_sztuke) min_cena_za_sztuke,
    	max (cena_za_sztuke) max_cena_za_sztuke,
    	avg (cena_za_sztuke) avg_cena_za_sztuke,
    	stdev (cena_za_sztuke) stdev_cena_za_sztuke
      from  tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
    group by RokMc, typ, kod_towarowy
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [dot_struktura_miesieczna_agr_miesiac]', @@PROCID, 1
    --
    insert into stat.dot_struktura_miesieczna_agr_miesiac
    select  typ,
    	RokMc/100 as rok, 
    	kod_towarowy,
    	sum(ile_poz) ile_poz,
    	sum(wartosc_faktury) wartosc_faktury,
    	min (cena_za_kilogram) min_cena_za_kilogram,
    	max (cena_za_kilogram) as max_cena_za_kilogram,
    	avg (cena_za_kilogram) as avg_cena_za_kilogram,
    	stdev (cena_za_kilogram) as stdev_cena_za_kilogram,
    	min (cena_za_sztuke) min_cena_za_sztuke,
    	max (cena_za_sztuke) max_cena_za_sztuke,
    	avg (cena_za_sztuke) avg_cena_za_sztuke,
    	stdev (cena_za_sztuke) stdev_cena_za_sztuke
      from  tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran str
    group by RokMc/100, typ, kod_towarowy
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [tmp].[vat_ilosc]', @@PROCID, 1
    --
	print 'KOPYTKO!'

		TRUNCATE TABLE tmp.vat_ilosc;
		INSERT INTO tmp.vat_ilosc (NIP, RokMc, ile_przywoz, ile_wywoz, suma_przywoz, suma_wywoz)
        select [NIP], 
               RokMc, 
               (case when sum(trans_nabycie) > 0 then 1 else 0 end) ile_przywoz,
               (case when sum(trans_dostawa) > 0 then 1 else 0 end) ile_wywoz,
               sum(trans_nabycie) suma_przywoz,
               sum(trans_dostawa) suma_wywoz
          from stat.dgv_kopia_intr_rdin
         where status_us <> 'A' and RokMc BETWEEN @p_rok*100+1 AND @p_rok*100+12
      group by RokMc, [NIP]
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [tmp].[vat_ilosc_intr]', @@PROCID, 1
    --
    truncate table tmp.vat_ilosc_intr;
    insert into tmp.vat_ilosc_intr
    select distinct nip_zobowiazanego nip, 
           RokMc,
           typ
    from tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
    where RokMc BETWEEN @p_rok*100+1 and @p_rok*100+12
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [dot_podmiot_dane_roczne]', @@PROCID, 1
    --
        insert into stat.dot_podmiot_dane_roczne
        select p.nip nip,  
               vat.RokMc rok,				--TODOKN: Check [rok] w tabeli [vat] - jakie dane są przechowywane?
               isnull((select count(*) from tmp.vat_ilosc_intr intr where intr.RokMc=@p_rok and intr.typ='P' and intr.nip=p.nip),0) ilosc_intrastat_przywoz,
               isnull((select count(*) from tmp.vat_ilosc_intr intr where intr.RokMc=@p_rok and intr.typ='W' and intr.nip=p.nip),0) ilosc_intrastat_wywoz,
               sum(isnull(ile_przywoz,0)) ilosc_vat_przywoz,
               sum(isnull(ile_wywoz,0)) ilosc_vat_wywoz,       
               isnull(case when sum(isnull(ile_przywoz,0)) > 0 then sum(isnull(suma_przywoz,0))/sum(isnull(ile_przywoz,0)) end ,0)  sr_vat_przywoz,
               isnull(case when sum(isnull(ile_wywoz,0)) > 0 then sum(isnull(suma_wywoz,0))/sum(isnull(ile_wywoz,0)) end ,0)  sr_vat_wywoz  
          from stat.dgv_kopia_intr_dane_pod p, 
			   tmp.vat_ilosc as vat
         where vat.[NIP] = p.nip and vat.RokMc BETWEEN @p_rok*100+1 AND @p_rok*100+12
        group by vat.RokMc, p.nip, p.id_pod
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [tmp].[intr_zero]', @@PROCID, 1
    --
		TRUNCATE TABLE tmp.intr_zero;
		insert into tmp.intr_zero
        select typ,    
               RokMc,
               nip_zobowiazanego nip, 
               (case when count(*)>0 then 'T' else 'N' end) intr_zerowy
          from stat.dgv_kopia_istat_dekl_wynik_dok d
         where d.[Status] <> 'u' and RokMc between @p_rok * 100+1 and @p_rok * 100 + 12
           and not exists (select 1 from stat.dgv_kopia_istat_dekl_wynik_poz p where p.id_dok=d.id_dok)
      group by nip_zobowiazanego, typ, RokMc
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [tmp].[vat_zero]', @@PROCID, 1
    --
		truncate table tmp.vat_zero;
		insert into tmp.vat_zero (NIP, RokMc, vat_zerowy_przywoz, vat_zerowy_wywoz)
        select [NIP],   
               RokMc, 
               (case when sum(trans_nabycie)=0 then 'T' else 'N' end) vat_zerowy_przywoz, 
               (case when sum(trans_dostawa)=0 then 'T' else 'N' end) vat_zerowy_wywoz     
          from stat.dgv_kopia_intr_rdin
         where status_us <> 'A' and RokMc between @p_rok * 100+1 and @p_rok * 100 + 12 
      group by RokMc, [NIP]
    --
    exec [stat].[DziennikWpisInfo] 'Agregacja danych do tabeli [dot_podmiot_dane_miesieczne]', @@PROCID, 1
    --
        insert into stat.dot_podmiot_dane_miesieczne
        select RokMc,
               nip,
               isnull((select intr_zerowy from tmp.intr_zero z where z.RokMc=op.RokMc and z.nip=pod.nip and z.typ='P'),'N') intr_zerowy_przywoz,
               isnull((select intr_zerowy from tmp.intr_zero z where z.RokMc=op.RokMc and z.nip=pod.nip and z.typ='W'),'N') intr_zerowy_wywoz,
               isnull((select vat_zerowy_przywoz from tmp.vat_zero z where z.RokMc=op.RokMc and z.nip=pod.nip),'N') vat_zerowy_przywoz,
               isnull((select vat_zerowy_wywoz from tmp.vat_zero z where z.RokMc=op.RokMc and z.nip=pod.nip),'N') vat_zerowy_wywoz  
        from  (select distinct RokMc, id_pod from  stat.dgv_kopia_dot_okres_sprawozd) as op,
				stat.dgv_kopia_intr_dane_pod as pod 
        where pod.id_pod=op.id_pod and op.RokMc = @p_rok
    --
    exec [stat].[DziennikWpisInfo] 'koniec', @@PROCID, 1
	exec [stat].DziennikCzas @Id;
    --


	--TRUNCATE TABLE tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran;

end