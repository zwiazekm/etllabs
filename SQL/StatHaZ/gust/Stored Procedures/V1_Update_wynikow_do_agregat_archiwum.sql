CREATE PROCEDURE gust.V1_Update_wynikow_do_agregat_archiwum
AS
declare @v_komunikat  varchar (1000)
declare @LogId bigint;

exec @LogId = stat.DziennikWpisInfo 'start: implementacja_danych_do_zbioru', @@PROCID;

-- dgt_eksport_intr_agr
	-- Implementacja do Statystyki
  INSERT INTO stat.dgt_eksport_intr_agr
	SELECT     ek_pcn, ek_zp, ek_pcnp, kraj_przeznaczenia, ek_odbiorca, ek_nip, ek_miesiac_rok, ek_rodzaj_transakcji, ek_kod_transportu, 
                      ek_kod_warunkow_dostawy, ek_kod_izby_celnej, ek_kod_procedury_celnej, ek_znacznik_kategorii_progowej, ek_masa_netto, ilosc, 
                      ek_wartosc_stat_zl, ek_wartosc_stat_usd, ek_wartosc_stat_eur, ek_wartosc_faktury, ek_iddoknr, ek_id_dok, ek_iddoknr_pozid, ek_id_dok_pozid
	FROM         gust.V1_eksport_intr_agr

--wstawienie informacji do Dziennika
	select @v_komunikat = 'dgt_eksport_intr_agr : ' + convert (varchar(20), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat, @@PROCID;


-- dgt_import_intr_agr
	-- Implementacja do Statystyki
   INSERT INTO stat.dgt_import_intr_agr
	SELECT     im_pcn, im_zp, im_pcnp, kraj_pochodzenia, kraj_wysylki, im_odbiorca, im_nip, im_miesiac_rok, im_rodzaj_transakcji, im_kod_transportu, 
                      im_kod_warunkow_dostawy, im_kod_izby_celnej, im_kod_procedury_celnej, im_znacznik_kategorii_progowej, im_masa_netto, im_ilosc, 
                      im_wartosc_stat_zl, im_wartosc_stat_usd, im_wartosc_stat_eur, im_wartosc_faktury, im_iddoknr, im_iddoknr_pozid, im_id_dok, 
                      im_id_dok_pozid
	FROM         gust.V1_import_intr_agr

--wstawienie informacji do Dziennika
	select @v_komunikat = 'dgt_import_intr_agr : ' + convert (varchar(20), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat, @@PROCID;

-- dgt_eksport_sad_sads_agr
	-- Implementacja do Statystyki
   INSERT INTO stat.dgt_eksport_sad_sads_agr
	SELECT * 
	 FROM         gust.V1_eksport_sad_sads_agr


--wstawienie informacji do Dziennika
	select @v_komunikat = 'dgt_eksport_sad_sads_agr : ' + convert (varchar(20), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat, @@PROCID;

--dgt_import_sad_sads_agr
	-- Implementacja do Statystyki
   INSERT INTO stat.dgt_import_sad_sads_agr
	SELECT * 
	 FROM         gust.V1_import_sad_sads_agr

--wstawienie informacji do Dziennika
	select @v_komunikat = 'dgt_import_sadr_sads_agr : ' + convert (varchar(20), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat, @@PROCID;

--eksport_sad_sads_intr_agr
	-- Implementacja do Statystyki
   INSERT INTO stat.dgt_eksport_sad_sads_intr_agr
	SELECT * 
	 FROM         gust.V1_eksport_sad_sads_intr_agr

--wstawienie informacji do Dziennika
	select @v_komunikat = 'dgt_eksport_sad_sads_intr_agr : ' + convert (varchar(20), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat, @@PROCID;
	

--import_sad_sads_intr_agr
	-- Implementacja do Statystyki
   INSERT INTO stat.dgt_import_sad_sads_intr_agr
	SELECT * 
	 FROM         gust.V1_import_sad_sads_intr_agr

--wstawienie informacji do Dziennika
	select @v_komunikat = 'dgt_import_sad_sads_intr_agr : ' + convert (varchar(20), @@ROWCOUNT) + ' wiersze/y'
	exec stat.DziennikWpisInfo @v_komunikat, @@PROCID;


exec stat.DziennikWpisInfo 'stop: implementacja_danych_do_zbioru', @@PROCID;
exec stat.DziennikCzas @LogId;