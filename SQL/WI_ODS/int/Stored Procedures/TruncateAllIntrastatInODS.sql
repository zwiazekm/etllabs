-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-22
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego) z systemu Instastat.
-- =============================================
CREATE PROCEDURE [int].[TruncateAllIntrastatInODS]
AS
BEGIN
	SET NOCOUNT ON;
		TRUNCATE TABLE int.caac_bledne_dane_xml;
		TRUNCATE TABLE int.celina_bledne_dane_xml;
		TRUNCATE TABLE int.intr_ape;
		TRUNCATE TABLE int.intr_dane_uz;
		TRUNCATE TABLE int.istat_blad_zrodlowy;
		TRUNCATE TABLE int.poufnosc;
		TRUNCATE TABLE int.slowniki;
END