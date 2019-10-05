-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-22
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego) z systemu Instastat.
-- =============================================
CREATE PROCEDURE [int].[TruncateAllIntrastat]
AS
BEGIN
	SET NOCOUNT ON;
		TRUNCATE TABLE int.dokumenty;
		TRUNCATE TABLE int.intr_dane_pod;
		TRUNCATE TABLE int.intr_fwpdk;
		TRUNCATE TABLE int.intr_historia_podmiotu;
		TRUNCATE TABLE int.intr_kategoria;
		TRUNCATE TABLE int.intr_okres_sprawozd;
		TRUNCATE TABLE int.intr_priorytet;
		TRUNCATE TABLE int.intr_rdin;
		TRUNCATE TABLE int.intr_upowaznienie;
		TRUNCATE TABLE int.intr_ustalenia;
		TRUNCATE TABLE int.intr_wlasc_terytor;
		TRUNCATE TABLE int.istat_dekl_wynik_blad;
		TRUNCATE TABLE int.istat_dekl_wynik_dok;
		TRUNCATE TABLE int.istat_dekl_wynik_poz;
		TRUNCATE TABLE int.istat_dok_zrodlowy;
		TRUNCATE TABLE int.istat_zdarzenie;
		TRUNCATE TABLE int.istat_zmiana_danych;

END