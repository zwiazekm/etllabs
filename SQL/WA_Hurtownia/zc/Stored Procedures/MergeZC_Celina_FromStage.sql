
-- =============================================
-- Author:	
-- Create date: 2014-08-26
-- Description:	
-- =============================================

CREATE PROCEDURE [zc].[MergeZC_Celina_FromStage]
AS
BEGIN
	SET NOCOUNT ON;
		
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DT_Podmiot';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DT_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DT_Dyrektywa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DT_Historia';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DT_SrodekPrzewozowy';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DT_Kontener';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DT_Powiazanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DT_Towar';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DT_ZamkniecieCelne';

	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'INNY_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'INNY_Towar';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'INNY_Powiazanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'INNY_Dyrektywa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'INNY_Historia';

	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PSP_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PSP_Dyrektywa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PSP_Historia';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PSP_Podmiot';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PSP_Powiazanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PSP_SrodekPrzewozowy';

	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PW_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PW_SrodekPrzewozowy';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PW_Kontener';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PW_Powiazanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PW_Historia';

	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SADG_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SADG_Dyrektywa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SADG_Historia';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SADG_SrodekPrzewozowy';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SADG_Kontener';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SADG_Powiazanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SADG_Towar';

	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'ST_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'ST_DanePrzywozuWywozu';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'ST_Dyrektywa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'ST_Historia';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'ST_Podmiot';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'ST_Powiazanie';

	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_Skladajacy';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_Kontrahent';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_Towar';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_DokumentWymagany';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_Dyrektywa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_Historia';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_IloscTowaru';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_InformacjaDodatkowa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_KodDodatkowyPL';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_KodDodatkowyUE';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_OplataDoPozycji';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_Powiazanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DPDZ_Srodek';

	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_Kontrahent';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_Skladajacy';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_DokumentPoprzedni';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_Dyrektywa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_Historia';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_Kontener';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_KontenerZamkniecie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_Powiazanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_SrodekPrzewozowy';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_Towar';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'DS_TransportZamkniecie';

	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_Skladajacy';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_Kontrahent';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_DokumentPoprzedni';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_DokumentWymagany';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_Dyrektywa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_Historia';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_Towar';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_Kontener';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_Powiazanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_Transport';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_TransportZamkniecie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'PWD_InformacjaDodatkowa';

	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Skladajacy';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Kontrahent';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Dokument';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Towar';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_DokumentPoprzedni';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_DokumentWymagany';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Dyrektywa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Historia';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_IloscTowaru';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_InformacjaDodatkowa';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_KodDodatkowyPL';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_KodDodatkowyUE';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Kontener';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Kontyngent';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Korekta';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Nadawca';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Odbiorca';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Opakowanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Oplata';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Podklasyfikacja';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Powiazanie';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_SrodekPrzewozowy';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_SzczegolyWartosci';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Transport';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_UrzadKontrolny';
	EXEC [zc].[MergeTableFromStageHurtownia_Celina] 'SAD_Zamkniecie';
		
END