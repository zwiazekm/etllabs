﻿CREATE PROCEDURE [zef2DW].[MergeAllFromStageHurtownia]
AS
BEGIN
	SET NOCOUNT ON;
	
EXEC zef2DW.MergeTableFromStageHurtownia 'Kontrahent';
EXEC zef2DW.MergeTableFromStageHurtownia 'AZNN_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'AZNN_Przelewy';
EXEC zef2DW.MergeTableFromStageHurtownia 'AZNN_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'BO_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'BO_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DAKC_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DAKC_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DAKO_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DAKO_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DAKO_Samochody';
EXEC zef2DW.MergeTableFromStageHurtownia 'DKOR_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DKOR_Potwierdzenie';
EXEC zef2DW.MergeTableFromStageHurtownia 'DKOR_DokumentZaplaty';
EXEC zef2DW.MergeTableFromStageHurtownia 'DKOR_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DKPI_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DKPI_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOOD_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOOD_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOOP_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOOP_Pierwotne';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOOP_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOPN_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOPN_Pierwotny';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOPN_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOPO_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOPO_Pierwotne';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOPO_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOPR_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOPR_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DORA_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DORA_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DORA_Pierwotne';
EXEC zef2DW.MergeTableFromStageHurtownia 'DORA_Raty';
EXEC zef2DW.MergeTableFromStageHurtownia 'DOUP_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DPDZ_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DPDZ_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DPDZ_DokumentZaplaty';
EXEC zef2DW.MergeTableFromStageHurtownia 'DUNA_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DUNA_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DUOD_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DUOD_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DVIM_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DVIM_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DWNN_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DWNN_DokumentZaplaty';
EXEC zef2DW.MergeTableFromStageHurtownia 'DWNN_Potwierdzenie';
EXEC zef2DW.MergeTableFromStageHurtownia 'DWNN_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DZAB_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DZMT_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DZMW_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DZMW_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DZWR_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'DZWR_Pierwotny';
EXEC zef2DW.MergeTableFromStageHurtownia 'DZWR_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'DZWR_Samochody';
EXEC zef2DW.MergeTableFromStageHurtownia 'HIPN_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'HIPN_DokumentSkojarzony';
EXEC zef2DW.MergeTableFromStageHurtownia 'HIPN_DokumentZabezpieczony';
EXEC zef2DW.MergeTableFromStageHurtownia 'KPAD_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'KPAD_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'KZPN_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'KZPN_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'MAND_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'MAND_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'NCPR_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'NCPR_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'ODPD_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'ODPD_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'ODPN_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'ODPN_Potwierdzenie';
EXEC zef2DW.MergeTableFromStageHurtownia 'ODPN_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'OKAR_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'OKAR_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'OZWW_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'OZWW_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'PKPO_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'PKPO_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'PODZ_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'PONW_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'POPC_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'POPC_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'POTS_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'POTS_Pierwotne';
EXEC zef2DW.MergeTableFromStageHurtownia 'POTS_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'POWK_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'POWK_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'POZA_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'POZA_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'POZA_Pierwotny';
EXEC zef2DW.MergeTableFromStageHurtownia 'PUPD_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'PUPD_Pierwotne';
EXEC zef2DW.MergeTableFromStageHurtownia 'SADS_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'SADS_DokumentZaplaty';
EXEC zef2DW.MergeTableFromStageHurtownia 'SADS_Uzupelniajacy';
EXEC zef2DW.MergeTableFromStageHurtownia 'SADS_Potwierdzenie';
EXEC zef2DW.MergeTableFromStageHurtownia 'SADS_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'SADU_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'SADU_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'SADU_Uzupelniajacy';
EXEC zef2DW.MergeTableFromStageHurtownia 'UPWK_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'UPWK_Okresy';
EXEC zef2DW.MergeTableFromStageHurtownia 'USAD_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'USAD_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'USAD_Potwierdzenie';
EXEC zef2DW.MergeTableFromStageHurtownia 'USAD_DokumentZaplaty';
EXEC zef2DW.MergeTableFromStageHurtownia 'USAD_Uzupelniajacy';
EXEC zef2DW.MergeTableFromStageHurtownia 'WNSB_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'WNSB_Banderola';
EXEC zef2DW.MergeTableFromStageHurtownia 'WPOZ_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'WZAB_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'ZAKK_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'ZAKK_Opis_Wyrobow';
EXEC zef2DW.MergeTableFromStageHurtownia 'ZAKP_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'ZMWM_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'ZNPN_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'ZNPN_Pozycje';

--ZZ6
EXEC zef2DW.MergeTableFromStageHurtownia 'OKAR_Wplaty';
EXEC zef2DW.MergeTableFromStageHurtownia 'POPC_Wplaty';
EXEC zef2DW.MergeTableFromStageHurtownia 'IOZA_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'IOZA_Pierwotne';
EXEC zef2DW.MergeTableFromStageHurtownia 'IOZA_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'KZD_Dokument';
EXEC zef2DW.MergeTableFromStageHurtownia 'KZD_Pozycje';
EXEC zef2DW.MergeTableFromStageHurtownia 'KontrahentSolidarny';

END