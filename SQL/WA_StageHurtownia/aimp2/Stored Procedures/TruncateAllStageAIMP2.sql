


-- =============================================
-- Author:
-- Create date: 2016-10-05
-- Description:	Procedura czyści wszystkie tabele znajdujące się w WA_StageHurtownia przygotowując je do zasilenia (przyrostowego) z systemu AIS_ICS
-- =============================================
CREATE PROCEDURE [aimp2].[TruncateAllStageAIMP2]
AS
BEGIN
	SET NOCOUNT ON;
		
	TRUNCATE TABLE aimp2.ZCP_MetodaPlatnosci;
	TRUNCATE TABLE aimp2.ZCP_TowarDokumentPoprzedniPozycje;
	TRUNCATE TABLE aimp2.DPDZ_SzczegolyWartosciTowarow;
	TRUNCATE TABLE aimp2.PWD_DokumentPoprzedniPozycje;
	TRUNCATE TABLE aimp2.ZCP_DokumentWymagany;
	TRUNCATE TABLE aimp2.ZCP_InformacjaPODZ;
	TRUNCATE TABLE aimp2.ZCP_Kontyngent;
	TRUNCATE TABLE aimp2.ZCP_Opakowanie;
	TRUNCATE TABLE aimp2.ZCP_Procedura;
	TRUNCATE TABLE aimp2.ZCP_Samochody;
	TRUNCATE TABLE aimp2.ZCP_SrodekTaryfowy;
	TRUNCATE TABLE aimp2.ZCP_TowarDokumentPoprzedni;
	TRUNCATE TABLE aimp2.ZCP_TowarInformacjaDodatkowa;
	TRUNCATE TABLE aimp2.ZCP_TowarInformacjaWDZ;
	TRUNCATE TABLE aimp2.ZCP_TowarKontener;
	TRUNCATE TABLE aimp2.ZCP_TowarKontrakt;
	TRUNCATE TABLE aimp2.ZCP_WartoscTowarow;
	TRUNCATE TABLE aimp2.DPDZ_DokumentPoprzedni;
	TRUNCATE TABLE aimp2.DPDZ_DokumentWymagany;
	TRUNCATE TABLE aimp2.DPDZ_IloscTowaru;
	TRUNCATE TABLE aimp2.DPDZ_InformacjaDodatkowa;
	TRUNCATE TABLE aimp2.DPDZ_MetodaPlatnosci;
	TRUNCATE TABLE aimp2.DPDZ_Opakowanie;
	TRUNCATE TABLE aimp2.DPDZ_PodmiotInfDodatkowa;
	TRUNCATE TABLE aimp2.DPDZ_SrodekTaryfowy;
	TRUNCATE TABLE aimp2.DPDZ_WartoscTowarow;
	TRUNCATE TABLE aimp2.DSK_DokumentPoprzedni;
	TRUNCATE TABLE aimp2.DSK_DokumentWymagany;
	TRUNCATE TABLE aimp2.DSK_InformacjaDodatkowa;
	TRUNCATE TABLE aimp2.DSK_OdmowaSkladowania;
	TRUNCATE TABLE aimp2.DSK_Opakowanie;
	TRUNCATE TABLE aimp2.DSK_PodmiotLancuchDostawTowar;
	TRUNCATE TABLE aimp2.DSK_TowarKontener;
	TRUNCATE TABLE aimp2.DSK_UniewaznienieTowaru;
	TRUNCATE TABLE aimp2.DSK_ZamkniecieCelneNumery;
	TRUNCATE TABLE aimp2.PWD_DaneARR;
	TRUNCATE TABLE aimp2.PWD_DokumentPoprzedni;
	TRUNCATE TABLE aimp2.PWD_DokumentWymagany;
	TRUNCATE TABLE aimp2.PWD_InformacjaDodatkowa;
	TRUNCATE TABLE aimp2.PWD_Kontener;
	TRUNCATE TABLE aimp2.PWD_Kontyngent;
	TRUNCATE TABLE aimp2.PWD_Opakowanie;
	TRUNCATE TABLE aimp2.PWD_PodmiotInfDodatkowa;
	TRUNCATE TABLE aimp2.PWD_SrodekTaryfowy;
	TRUNCATE TABLE aimp2.ZCP_DokumentPoprzedniPozycje;
	TRUNCATE TABLE aimp2.ZCP_OsobaFizycznaInfDodatkowa;
	TRUNCATE TABLE aimp2.ZCP_PodmiotInfDodatkowa;
	TRUNCATE TABLE aimp2.ZCP_Towar;
	TRUNCATE TABLE aimp2.DPDZ_LokalizacjaTowarow;
	TRUNCATE TABLE aimp2.DPDZ_Odbiorca;
	TRUNCATE TABLE aimp2.DPDZ_Podmiot;
	TRUNCATE TABLE aimp2.DPDZ_Towar;
	TRUNCATE TABLE aimp2.DSK_DokumentPoprzedniDeklaracja;
	TRUNCATE TABLE aimp2.DSK_Kontener;
	TRUNCATE TABLE aimp2.DSK_LokalizacjaTowarow;
	TRUNCATE TABLE aimp2.DSK_PodmiotLancuchDostawDeklaracja;
	TRUNCATE TABLE aimp2.DSK_PodpisujacyDokument;
	TRUNCATE TABLE aimp2.DSK_Towar;
	TRUNCATE TABLE aimp2.DSK_Transport;
	TRUNCATE TABLE aimp2.DSK_ZamkniecieCelne;
	TRUNCATE TABLE aimp2.PWD_LokalizacjaTowarow;
	TRUNCATE TABLE aimp2.PWD_OsobaFizyczna;
	TRUNCATE TABLE aimp2.PWD_Podmiot;
	TRUNCATE TABLE aimp2.PWD_Procedura;
	TRUNCATE TABLE aimp2.PWD_Towar;
	TRUNCATE TABLE aimp2.PWD_TransportNaGranicy;
	TRUNCATE TABLE aimp2.PWD_TransportWewnetrzny;
	TRUNCATE TABLE aimp2.ZCP_DokumentPoprzedni;
	TRUNCATE TABLE aimp2.ZCP_InformacjaDodatkowa;
	TRUNCATE TABLE aimp2.ZCP_InformacjaPOD;
	TRUNCATE TABLE aimp2.ZCP_InformacjaWDZ;
	TRUNCATE TABLE aimp2.ZCP_Kontener;
	TRUNCATE TABLE aimp2.ZCP_Kontrakt;
	TRUNCATE TABLE aimp2.ZCP_LokalizacjaTowarow;
	TRUNCATE TABLE aimp2.ZCP_Oplaty;
	TRUNCATE TABLE aimp2.ZCP_OsobaFizyczna;
	TRUNCATE TABLE aimp2.ZCP_Podmiot;
	TRUNCATE TABLE aimp2.ZCP_Transakcje;
	TRUNCATE TABLE aimp2.ZCP_TransportNaGranicy;
	TRUNCATE TABLE aimp2.ZCP_TransportWewnetrzny;
	TRUNCATE TABLE aimp2.ZCP_WarunkiDostawy;
	TRUNCATE TABLE aimp2.DPDZ_Dokument;
	TRUNCATE TABLE aimp2.DPDZ_OsobaFizyczna;
	TRUNCATE TABLE aimp2.DPDZ_PodmiotAdres;
	TRUNCATE TABLE aimp2.DSK_Dokument;
	TRUNCATE TABLE aimp2.DSK_OsobaFizyczna;
	TRUNCATE TABLE aimp2.DSK_PodmiotGospodarczy;
	TRUNCATE TABLE aimp2.PWD_DefinicjaKontyngentu;
	TRUNCATE TABLE aimp2.PWD_Dokument;
	TRUNCATE TABLE aimp2.PWD_PodmiotAdres;
	TRUNCATE TABLE aimp2.ZCP_DecyzjaAdministracyjna;
	TRUNCATE TABLE aimp2.ZCP_Dokument;
	TRUNCATE TABLE aimp2.ZCP_PodmiotAdres;
		

END