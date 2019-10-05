


-- =============================================
-- Author:
-- Create date: 2016-11-21
-- Description:	Procedura czyści wszystkie tabele znajdujące się w WA_StageHurtownia przygotowując je do zasilenia (przyrostowego) 
--z systemu AES2
-- =============================================
CREATE PROCEDURE [aes2].[TruncateAllStageAES2]
AS
BEGIN
	SET NOCOUNT ON;
		
	TRUNCATE TABLE aes2.DWA_Dokument;
	TRUNCATE TABLE aes2.DWA_DokumentWymagany;
	TRUNCATE TABLE aes2.DWA_Kontener;
	TRUNCATE TABLE aes2.DWA_Opakowanie;
	TRUNCATE TABLE aes2.DWA_Podmiot;
	TRUNCATE TABLE aes2.DWA_Towar;
	TRUNCATE TABLE aes2.DWA_TowarPodmiot;
	TRUNCATE TABLE aes2.DWA_Trasa;
	TRUNCATE TABLE aes2.DWA_ZamkniecieCelne;
	TRUNCATE TABLE aes2.DWU_Dokument;
	TRUNCATE TABLE aes2.DWU_DokumentWymagany;
	TRUNCATE TABLE aes2.DWU_Kontener;
	TRUNCATE TABLE aes2.DWU_Opakowanie;
	TRUNCATE TABLE aes2.DWU_Podmiot;
	TRUNCATE TABLE aes2.DWU_Towar;
	TRUNCATE TABLE aes2.DWU_TowarPodmiot;
	TRUNCATE TABLE aes2.DWU_Trasa;
	TRUNCATE TABLE aes2.DWU_WynikAnalizyRyzyka;
	TRUNCATE TABLE aes2.DWU_ZamkniecieCelne;
	TRUNCATE TABLE aes2.MEX_DaneCelne;
	TRUNCATE TABLE aes2.MEX_Dokument;
	TRUNCATE TABLE aes2.MEX_Przewoznik;
	TRUNCATE TABLE aes2.MEX_Towar;
	TRUNCATE TABLE aes2.QUERY_Dokument;
	TRUNCATE TABLE aes2.QUERY_DokumentPoprzedni;
	TRUNCATE TABLE aes2.QUERY_DokumentWymagany;
	TRUNCATE TABLE aes2.QUERY_InformacjaDodatkowa;
	TRUNCATE TABLE aes2.QUERY_Kontener;
	TRUNCATE TABLE aes2.QUERY_Opakowanie;
	TRUNCATE TABLE aes2.QUERY_Podmiot;
	TRUNCATE TABLE aes2.QUERY_Towar;
	TRUNCATE TABLE aes2.QUERY_TowarPodmiot;
	TRUNCATE TABLE aes2.QUERY_Trasa;
	TRUNCATE TABLE aes2.QUERY_WynikAnalizyRyzyka;
	TRUNCATE TABLE aes2.QUERY_ZamkniecieCelne;
	TRUNCATE TABLE aes2.TRS_Dokument;
	TRUNCATE TABLE aes2.TRS_DokumentyDeklaracji;
	TRUNCATE TABLE aes2.TRS_Pozycje;
	TRUNCATE TABLE aes2.TRS_Rezerwacje;
	TRUNCATE TABLE aes2.ZUZ_Dokument;
	TRUNCATE TABLE aes2.ZUZ_DokumentPoprzedni;
	TRUNCATE TABLE aes2.ZUZ_DokumentWymagany;
	TRUNCATE TABLE aes2.ZUZ_Ilosc;
	TRUNCATE TABLE aes2.ZUZ_InformacjaDodatkowa;
	TRUNCATE TABLE aes2.ZUZ_KodDodatkowyPL;
	TRUNCATE TABLE aes2.ZUZ_KodDodatkowyPLWUzupln;
	TRUNCATE TABLE aes2.ZUZ_KodDodatkowyUE;
	TRUNCATE TABLE aes2.ZUZ_KodDodatkowyUEWUzupln;
	TRUNCATE TABLE aes2.ZUZ_Kontener;
	TRUNCATE TABLE aes2.ZUZ_Opakowanie;
	TRUNCATE TABLE aes2.ZUZ_Oplata;
	TRUNCATE TABLE aes2.ZUZ_Podmiot;
	TRUNCATE TABLE aes2.ZUZ_Pozwolenie;
	TRUNCATE TABLE aes2.ZUZ_ProceduraGospodarcza;
	TRUNCATE TABLE aes2.ZUZ_SrodkiTaryfowe;
	TRUNCATE TABLE aes2.ZUZ_Towar;
	TRUNCATE TABLE aes2.ZUZ_TowarPodmiot;
	TRUNCATE TABLE aes2.ZUZ_Trasa;
	TRUNCATE TABLE aes2.ZUZ_ZamkniecieCelne;
	TRUNCATE TABLE aes2.ZUZ_ZamkniecieCelneWUzupeln;
	TRUNCATE TABLE aes2.ZUZ_Zglaszajacy;
	TRUNCATE TABLE aes2.ZWA_Dokument;
	TRUNCATE TABLE aes2.ZWA_DokumentPoprzedni;
	TRUNCATE TABLE aes2.ZWA_DokumentWymagany;
	TRUNCATE TABLE aes2.ZWA_InformacjaDodatkowa;
	TRUNCATE TABLE aes2.ZWA_Komentarz;
	TRUNCATE TABLE aes2.ZWA_Kontener;
	TRUNCATE TABLE aes2.ZWA_Opakowanie;
	TRUNCATE TABLE aes2.ZWA_Podmiot;
	TRUNCATE TABLE aes2.ZWA_Towar;
	TRUNCATE TABLE aes2.ZWA_TowarKomentarz;
	TRUNCATE TABLE aes2.ZWA_TowarPodmiot;
	TRUNCATE TABLE aes2.ZWA_ZamkniecieCelne;
	TRUNCATE TABLE aes2.ZWP_Dokument;
	TRUNCATE TABLE aes2.ZWP_DokumentPoprzedni;
	TRUNCATE TABLE aes2.ZWP_DokumentWymagany;
	TRUNCATE TABLE aes2.ZWP_InformacjaDodatkowa;
	TRUNCATE TABLE aes2.ZWP_Komentarz;
	TRUNCATE TABLE aes2.ZWP_Kontener;
	TRUNCATE TABLE aes2.ZWP_Opakowanie;
	TRUNCATE TABLE aes2.ZWP_Podmiot;
	TRUNCATE TABLE aes2.ZWP_Towar;
	TRUNCATE TABLE aes2.ZWP_TowarKomentarz;
	TRUNCATE TABLE aes2.ZWP_TowarPodmiot;
	TRUNCATE TABLE aes2.ZWP_Trasa;
	TRUNCATE TABLE aes2.ZWP_ZamkniecieCelne;
	TRUNCATE TABLE aes2.ZWU_Dokument;
	TRUNCATE TABLE aes2.ZWU_DokumentPoprzedni;
	TRUNCATE TABLE aes2.ZWU_DokumentWymagany;
	TRUNCATE TABLE aes2.ZWU_Ilosc;
	TRUNCATE TABLE aes2.ZWU_InformacjaDodatkowa;
	TRUNCATE TABLE aes2.ZWU_KodDodatkowyPL;
	TRUNCATE TABLE aes2.ZWU_KodDodatkowyUE;
	TRUNCATE TABLE aes2.ZWU_Komentarz;
	TRUNCATE TABLE aes2.ZWU_Kontener;
	TRUNCATE TABLE aes2.ZWU_Korekta;
	TRUNCATE TABLE aes2.ZWU_Opakowanie;
	TRUNCATE TABLE aes2.ZWU_Oplata;
	TRUNCATE TABLE aes2.ZWU_Podmiot;
	TRUNCATE TABLE aes2.ZWU_Towar;
	TRUNCATE TABLE aes2.ZWU_TowarKomentarz;
	TRUNCATE TABLE aes2.ZWU_TowarPodmiot;
	TRUNCATE TABLE aes2.ZWU_Trasa;
	TRUNCATE TABLE aes2.ZWU_ZamkniecieCelne;
	TRUNCATE TABLE aes2.ZWU_Zglaszajacy;
		

END