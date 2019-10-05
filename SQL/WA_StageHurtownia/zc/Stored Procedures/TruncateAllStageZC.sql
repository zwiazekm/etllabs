CREATE PROCEDURE [zc].[TruncateAllStageZC]
AS
BEGIN
	SET NOCOUNT ON;

		TRUNCATE TABLE zc.DWA_Dokument;
		TRUNCATE TABLE zc.DWA_Trasa;
		TRUNCATE TABLE zc.DWA_Towar;
		TRUNCATE TABLE zc.DWA_Opakowanie;
		TRUNCATE TABLE zc.DWA_Kontener;
		TRUNCATE TABLE zc.DWA_ZamkniecieCelne;
		TRUNCATE TABLE zc.DWA_DokumentWymagany;
		TRUNCATE TABLE zc.DWA_TowarPodmiot;

		TRUNCATE TABLE zc.DWU_Trasa;
		TRUNCATE TABLE zc.DWU_Towar;
		TRUNCATE TABLE zc.DWU_Kontener;
		TRUNCATE TABLE zc.DWU_DokumentWymagany;
		TRUNCATE TABLE zc.DWU_ZamkniecieCelne;
		TRUNCATE TABLE zc.DWU_Opakowanie;
		TRUNCATE TABLE zc.DWU_WynikAnalizyRyzyka;
		TRUNCATE TABLE zc.DWU_TowarPodmiot;
		TRUNCATE TABLE zc.DWU_Dokument;

		TRUNCATE TABLE zc.MEX_Dokument;
		TRUNCATE TABLE zc.MEX_Przewoznik;
		TRUNCATE TABLE zc.MEX_DaneCelne;
		TRUNCATE TABLE zc.MEX_Towar;

		TRUNCATE TABLE zc.PDS_Podmiot;
		TRUNCATE TABLE zc.PDS_Zamkniecie;
		TRUNCATE TABLE zc.PDS_Kontener;
		TRUNCATE TABLE zc.PDS_Trasa;
		TRUNCATE TABLE zc.PDS_KolejnyUrzadWprowadzenia;
		TRUNCATE TABLE zc.PDS_TowarPodmiot;
		TRUNCATE TABLE zc.PDS_TransportNaGranicy;
		TRUNCATE TABLE zc.PDS_Opakowanie;
		TRUNCATE TABLE zc.PDS_DokumentWymagany;
		TRUNCATE TABLE zc.PDS_InformacjaDodatkowa;
		TRUNCATE TABLE zc.PDS_Towar;

		TRUNCATE TABLE zc.PTW_Podmiot;
		TRUNCATE TABLE zc.PTW_Towar;
		TRUNCATE TABLE zc.PTW_DaneCelne;

		TRUNCATE TABLE zc.ZWA_Towar;
		TRUNCATE TABLE zc.ZWA_Opakowanie;
		TRUNCATE TABLE zc.ZWA_Kontener;
		TRUNCATE TABLE zc.ZWA_DokumentPoprzedni;
		TRUNCATE TABLE zc.ZWA_DokumentWymagany;
		TRUNCATE TABLE zc.ZWA_InformacjaDodatkowa;
		TRUNCATE TABLE zc.ZWA_ZamkniecieCelne;
		TRUNCATE TABLE zc.ZWA_Komentarz;
		TRUNCATE TABLE zc.ZWA_TowarKomentarz;
		TRUNCATE TABLE zc.ZWA_Podmiot;
		TRUNCATE TABLE zc.ZWA_Dokument;

		TRUNCATE TABLE zc.ZWU_Zglaszajacy;
		TRUNCATE TABLE zc.ZWU_Trasa;
		TRUNCATE TABLE zc.ZWU_Kontener;
		TRUNCATE TABLE zc.ZWU_Korekta;
		TRUNCATE TABLE zc.ZWU_ZamkniecieCelne;
		TRUNCATE TABLE zc.ZWU_Komentarz;
		TRUNCATE TABLE zc.ZWU_TowarKomentarz;
		TRUNCATE TABLE zc.ZWU_Towar;
		TRUNCATE TABLE zc.ZWU_Opakowanie;
		TRUNCATE TABLE zc.ZWU_Ilosc;
		TRUNCATE TABLE zc.ZWU_DokumentPoprzedni;
		TRUNCATE TABLE zc.ZWU_DokumentWymagany;
		TRUNCATE TABLE zc.ZWU_InformacjaDodatkowa;
		TRUNCATE TABLE zc.ZWU_Oplata;
		TRUNCATE TABLE zc.ZWU_KodDodatkowyUE;
		TRUNCATE TABLE zc.ZWU_KodDodatkowyPL;
		TRUNCATE TABLE zc.ZWU_TowarPodmiot;
		TRUNCATE TABLE zc.ZWU_Podmiot;
		TRUNCATE TABLE zc.ZWU_Dokument;
		TRUNCATE TABLE zc.ZWA_TowarPodmiot;

	END