--========================================
--Author: Tomasz Pióro
--Date: 2014-08-20
--Description: Procedura usuwania wszystkich danych z systemu ZEFIR.
--========================================

CREATE PROCEDURE [a2].[ArchZEFIRUsunWszystkieDane]
	@Rok int
AS
	DECLARE @DataOd DATE = DATEFROMPARTS(@Rok+0, 1, 1);
	DECLARE @DataDo DATE = DATEFROMPARTS(@Rok+1, 1, 1);

	SET XACT_ABORT ON;
	BEGIN TRANSACTION;

	DELETE FROM zef.slowniki;
	DELETE FROM zef.samochody;
	DELETE FROM zef.mand_kwot;
	DELETE FROM zef.mand_kwal;
	DELETE FROM zef.ew_nal_agr;
	DELETE FROM zef.ew_egz_agr;

	DELETE FROM zef.pdok_akc4z;
	DELETE FROM zef.dok_akc4z;

	DELETE FROM zef.pdok_pog4z;
	DELETE FROM zef.dok_pog4z;

	DELETE FROM zef.popal;
	DELETE FROM zef.dok_opal;

	DELETE FROM zef.pdok_pog4z;
	DELETE FROM zef.dok_pog4z;

	DELETE FROM zef.popal;
	DELETE FROM zef.dok_opal;

	DELETE FROM zef.pdok_akc3z;
	DELETE FROM zef.dok_akc3zf;
	DELETE FROM zef.dok_akc3z;

	DELETE FROM zef.dok_ainf2;
	DELETE FROM zef.dok_ainf1;

	DELETE FROM zef.dl_kontr;
	DELETE FROM zef.dl_kontr_solid;
	DELETE FROM zef.dl_sprawy;

	DELETE FROM zef.pwplat;
	DELETE FROM zef.dok_wplaty;
	DELETE FROM zef.pdok_pok;
	DELETE FROM zef.dok_pok;
	DELETE FROM zef.dok_tytwyk;
	DELETE FROM zef.psad;
	DELETE FROM zef.dok_sad;
	DELETE FROM zef.dok_jednostka;
	DELETE FROM zef.pdok_akcz;
	DELETE FROM zef.dok_akcz;
	DELETE FROM zef.pspraw;
	DELETE FROM zef.dok_akc;
	DELETE FROM zef.sprawoz_meld;
	DELETE FROM zef.dok_ainf;
	DELETE FROM zef.dok_pog;
	DELETE FROM zef.dokumenty;
	DELETE FROM zef.kontrahenci;

	COMMIT TRANSACTION;

RETURN 0