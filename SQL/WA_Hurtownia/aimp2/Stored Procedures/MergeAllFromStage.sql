



-- =============================================
-- Author:
-- Create date: 2014-07-31
-- Description:	
-- =============================================

CREATE PROCEDURE [aimp2].[MergeAllFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_Dokument';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_OsobaFizyczna';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_PodmiotAdres';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_OsobaFizyczna';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_PodmiotGospodarczy';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_DefinicjaKontyngentu';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_Dokument';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_PodmiotAdres';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_DecyzjaAdministracyjna';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Dokument';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_PodmiotAdres';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_LokalizacjaTowarow';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_Odbiorca';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_Podmiot';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_Dokument';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_Towar';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_LokalizacjaTowarow';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_OsobaFizyczna';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_Podmiot';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_Procedura';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_TransportNaGranicy';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_TransportWewnetrzny';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_DokumentPoprzedni';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_InformacjaDodatkowa';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_InformacjaPOD';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_InformacjaWDZ';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Kontener';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Kontrakt';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_LokalizacjaTowarow';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Oplaty';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_OsobaFizyczna';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Podmiot';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Transakcje';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_TransportNaGranicy';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_TransportWewnetrzny';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_WarunkiDostawy';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_PodmiotInfDodatkowa';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_Towar';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_DokumentPoprzedni';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_DokumentPoprzedniDeklaracja';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_DokumentWymagany';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_InformacjaDodatkowa';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_Kontener';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_LokalizacjaTowarow';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_OdmowaSkladowania';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_Opakowanie';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_PodmiotLancuchDostawDeklaracja';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_PodmiotLancuchDostawTowar';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_PodpisujacyDokument';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_TowarKontener';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_Transport';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_UniewaznienieTowaru';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_ZamkniecieCelne';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_PodmiotInfDodatkowa';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_Towar';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_DokumentPoprzedniPozycje';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_OsobaFizycznaInfDodatkowa';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_PodmiotInfDodatkowa';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Towar';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_DokumentPoprzedni';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_DokumentWymagany';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_IloscTowaru';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_InformacjaDodatkowa';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_MetodaPlatnosci';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_Opakowanie';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_SrodekTaryfowy';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_WartoscTowarow';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DSK_ZamkniecieCelneNumery';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_DaneARR';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_DokumentPoprzedni';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_DokumentWymagany';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_InformacjaDodatkowa';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_Kontener';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_Kontyngent';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_Opakowanie';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_SrodekTaryfowy';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_DokumentWymagany';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_InformacjaPODZ';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Kontyngent';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Opakowanie';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Procedura';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_Samochody';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_SrodekTaryfowy';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_TowarDokumentPoprzedni';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_TowarInformacjaDodatkowa';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_TowarInformacjaWDZ';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_TowarKontener';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_TowarKontrakt';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_WartoscTowarow';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'DPDZ_SzczegolyWartosciTowarow';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'PWD_DokumentPoprzedniPozycje';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_MetodaPlatnosci';
	EXEC [aimp2].[MergeTableFromStageHurtownia] 'ZCP_TowarDokumentPoprzedniPozycje';


END