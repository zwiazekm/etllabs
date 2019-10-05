-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-07-24
-- Description:	Procedura czyści wszystkie tabele znajdujące się w WA_StageHurtownia przygotowując je do zasilenia (przyrostowego) z systemu PTA
-- =============================================
CREATE PROCEDURE [pta].[TruncateAllStagePTA]
AS
BEGIN
	SET NOCOUNT ON;
		
		TRUNCATE TABLE pta.AD_Dokument;
		TRUNCATE TABLE pta.AD_SADPrzywozu;
		TRUNCATE TABLE pta.AD_SzczegolyTransportu;
		TRUNCATE TABLE pta.AD_Wyrob;
		TRUNCATE TABLE pta.AD_Opakowanie;
		TRUNCATE TABLE pta.AD_KodCzynnosciWino;
		TRUNCATE TABLE pta.AD_Zaswiadczenie;
		TRUNCATE TABLE pta.AD_Podmiot;
		TRUNCATE TABLE pta.AD_Wlasciciel;
		TRUNCATE TABLE pta.AD_MiejsceOdbioru;
		TRUNCATE TABLE pta.AD_TypZadania;
		TRUNCATE TABLE pta.AD_Zadanie;
		
	END