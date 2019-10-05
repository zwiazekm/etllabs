
CREATE PROCEDURE [zef].[TruncateAllZefir1]
AS
BEGIN
	SET NOCOUNT ON;

		TRUNCATE TABLE zef.dl_kontr;
		TRUNCATE TABLE zef.dl_kontr_solid;
		TRUNCATE TABLE zef.dl_sprawy;
		TRUNCATE TABLE zef.dokumenty;
		TRUNCATE TABLE zef.kontrahenci;
		TRUNCATE TABLE zef.dok_jednostka;
		TRUNCATE TABLE zef.dok_opal;
		TRUNCATE TABLE zef.dok_sad;
		TRUNCATE TABLE zef.dok_tytwyk;
		TRUNCATE TABLE zef.dok_wplaty;
		TRUNCATE TABLE zef.mand_kwal;
		TRUNCATE TABLE zef.mand_kwot;
		TRUNCATE TABLE zef.popal;
		TRUNCATE TABLE zef.psad;
		TRUNCATE TABLE zef.pwplat;
		TRUNCATE TABLE zef.slowniki;
		TRUNCATE TABLE zef.sprawoz_meld;
		TRUNCATE TABLE zef.dok_ainf;
		TRUNCATE TABLE zef.dok_pog;
		TRUNCATE TABLE zef.dok_akc;
		TRUNCATE TABLE zef.pspraw;
		TRUNCATE TABLE zef.dok_akcz;
		TRUNCATE TABLE zef.pdok_akcz;
		TRUNCATE TABLE zef.dok_pok;
		TRUNCATE TABLE zef.pdok_pok;
		TRUNCATE TABLE zef.dok_ainf1;
		TRUNCATE TABLE zef.dok_ainf2;
		TRUNCATE TABLE zef.dok_akc3z;
		TRUNCATE TABLE zef.dok_akc3zf;
		TRUNCATE TABLE zef.pdok_akc3z;
		TRUNCATE TABLE zef.dok_pog4z;
		TRUNCATE TABLE zef.pdok_pog4z;
		TRUNCATE TABLE zef.dok_akc4z;
		TRUNCATE TABLE zef.pdok_akc4z;
		TRUNCATE TABLE zef.ew_egz_agr;
		TRUNCATE TABLE zef.ew_nal_agr;
		TRUNCATE TABLE zef.samochody;

END