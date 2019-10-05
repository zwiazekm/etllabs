-- =============================================
-- Author:		Kamil Nowiński
-- Create date: 2014-07-30
-- Description:	Wykonuje Merge danych dla obu tabel systemu VIES z WA_StageHurtownia do WA_Hurtownia.
-- =============================================

CREATE PROCEDURE [vies].[MergeAllFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	MERGE INTO vies.VIES_nabycia AS tgt
	USING [WA_StageHurtownia].vies.VIES_nabycia AS src
	ON (tgt.NIPNabywcy = src.NIPNabywcy AND tgt.Rok = src.Rok AND tgt.RodzajOkresu = src.RodzajOkresu AND tgt.NrOkresu = src.NrOkresu AND tgt.KodKraju = src.KodKraju AND tgt.NIPDostawcyZagr = src.NIPDostawcyZagr)
	WHEN MATCHED
	THEN UPDATE SET
		tgt.ZlozenieKorekta = CASE WHEN tgt.ZlozenieKorekta = 'K' THEN 'K' ELSE src.ZlozenieKorekta END,
		tgt.NabycieBezp = ISNULL(tgt.NabycieBezp, 0) + ISNULL(src.NabycieBezp, 0),
		tgt.nabycieTrojstr = ISNULL(tgt.nabycieTrojstr, 0) + ISNULL(src.nabycieTrojstr, 0), 
		tgt.UrzadSkarbowy = src.UrzadSkarbowy
	WHEN NOT MATCHED
	THEN INSERT (NIPNabywcy, Rok, RodzajOkresu, NrOkresu, KodKraju, ZlozenieKorekta, NabycieBezp, nabycieTrojstr, UrzadSkarbowy, NIPDostawcyZagr)
	VALUES (src.NIPNabywcy, src.Rok, src.RodzajOkresu, src.NrOkresu, src.KodKraju, src.ZlozenieKorekta, src.NabycieBezp, src.nabycieTrojstr, src.UrzadSkarbowy, src.NIPDostawcyZagr)
	;

	MERGE INTO vies.VIES_dostawy AS tgt
	USING [WA_StageHurtownia].vies.VIES_dostawy AS src
	ON (tgt.NIPDostawcy = src.NIPDostawcy AND tgt.Rok = src.Rok AND tgt.RodzajOkresu = src.RodzajOkresu AND tgt.NrOkresu = src.NrOkresu AND tgt.KodKraju = src.KodKraju AND tgt.NIPNabywcyZagr = src.NIPNabywcyZagr)
	WHEN MATCHED
	THEN UPDATE SET
		tgt.ZlozenieKorekta = CASE WHEN tgt.ZlozenieKorekta = 'K' THEN 'K' ELSE src.ZlozenieKorekta END,
		tgt.DostawaBezp = ISNULL(tgt.DostawaBezp, 0) + ISNULL(src.DostawaBezp, 0),
		tgt.DostawaTrojstr = ISNULL(tgt.DostawaTrojstr, 0) + ISNULL(src.DostawaTrojstr, 0), 
		tgt.UrzadSkarbowy = src.UrzadSkarbowy
	WHEN NOT MATCHED
	THEN INSERT (NIPDostawcy, Rok, RodzajOkresu, NrOkresu, KodKraju, ZlozenieKorekta, DostawaBezp, DostawaTrojstr, UrzadSkarbowy, NIPNabywcyZagr)
	VALUES (src.NIPDostawcy, src.Rok, src.RodzajOkresu, src.NrOkresu, src.KodKraju, src.ZlozenieKorekta, src.DostawaBezp, src.DostawaTrojstr, src.UrzadSkarbowy, src.NIPNabywcyZagr)
	;

END