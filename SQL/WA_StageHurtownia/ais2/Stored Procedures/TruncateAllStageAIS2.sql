

-- =============================================
-- Author:
-- Create date: 2016-10-05
-- Description:	Procedura czyści wszystkie tabele znajdujące się w WA_StageHurtownia przygotowując je do zasilenia (przyrostowego) z systemu AIS_ICS
-- =============================================
CREATE PROCEDURE [ais2].[TruncateAllStageAIS2]
AS
BEGIN
	SET NOCOUNT ON;
		
	TRUNCATE TABLE [ais2].PDS_Kontener;
	TRUNCATE TABLE [ais2].PTW_Dokument;
	TRUNCATE TABLE [ais2].PDS_TowarPodmiot;
	TRUNCATE TABLE [ais2].PDS_KolejnyUrzadWprowadzenia;
	TRUNCATE TABLE [ais2].PDS_Trasa;
	TRUNCATE TABLE [ais2].PDS_Opakowanie;
	TRUNCATE TABLE [ais2].PDS_DokumentWymagany;
	TRUNCATE TABLE [ais2].PDS_Zamkniecie;
	TRUNCATE TABLE [ais2].PDS_Dokument;
	TRUNCATE TABLE [ais2].PDS_InformacjaDodatkowa;
	TRUNCATE TABLE [ais2].PDS_TransportNaGranicy;
	TRUNCATE TABLE [ais2].PTW_DaneCelne;
	TRUNCATE TABLE [ais2].PDS_Podmiot;
	TRUNCATE TABLE [ais2].PTW_Towar;
	TRUNCATE TABLE [ais2].PDS_Towar;
	TRUNCATE TABLE [ais2].PTW_Podmiot;
		

END