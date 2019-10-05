CREATE PROCEDURE [wald].p_widelki_NOWA_WARTOSC AS

-- NADAWANIE NOWEJ WARTOSCI WYTYPOWANYM REKORDOM

-- import
UPDATE	[wald].[widelki_poprawione_rekordy]
SET	nowa_wartosc=CONVERT(decimal(15,0),pr.wartosc_fakt_stat/wi.srednia)
FROM	[wald].[widelki_poprawione_rekordy] pr INNER JOIN wald.widelki_IMPORT wi
		ON	pr.kod_towarowy=wi.kod_towarowy AND pr.znak=wi.znak AND pr.kraj_poch_przezn=wi.kraj_poch 
WHERE	pr.wartosc_fakt_stat IS NOT NULL AND pr.wartosc_fakt_stat<>0 AND wi.srednia IS NOT NULL AND wi.srednia<>0 AND pr.typ='P'

UPDATE	[wald].[widelki_poprawione_rekordy]
SET	nowa_wartosc=CONVERT(decimal(15,0),pr.wartosc_fakt_stat/wi.srednia)
FROM	[wald].[widelki_poprawione_rekordy] pr INNER JOIN wald.widelki_IMPORT wi
		ON	pr.kod_towarowy=wi.kod_towarowy AND pr.znak=wi.znak 
WHERE	pr.wartosc_fakt_stat IS NOT NULL AND pr.wartosc_fakt_stat<>0 AND wi.srednia IS NOT NULL AND wi.srednia<>0 AND pr.typ='P' 
		AND nowa_wartosc IS NULL AND wi.kraj_poch ='ZZ'

--eksport
UPDATE	[wald].[widelki_poprawione_rekordy]
SET	nowa_wartosc=CONVERT(decimal(15,0),pr.wartosc_fakt_stat/we.srednia)
FROM	[wald].[widelki_poprawione_rekordy] pr INNER JOIN wald.widelki_EKSPORT we
		ON	pr.kod_towarowy=we.kod_towarowy AND pr.znak=we.znak AND pr.kraj_poch_przezn=we.kraj_przezn
WHERE	pr.wartosc_fakt_stat IS NOT NULL AND pr.wartosc_fakt_stat<>0 AND we.srednia IS NOT NULL AND we.srednia<>0 AND pr.typ='W'

UPDATE	[wald].[widelki_poprawione_rekordy]
SET	nowa_wartosc=CONVERT(decimal(15,0),pr.wartosc_fakt_stat/we.srednia)
FROM	[wald].[widelki_poprawione_rekordy] pr INNER JOIN wald.widelki_EKSPORT we
		ON	pr.kod_towarowy=we.kod_towarowy AND pr.znak=we.znak 
WHERE	pr.wartosc_fakt_stat IS NOT NULL AND pr.wartosc_fakt_stat<>0 AND we.srednia IS NOT NULL AND we.srednia<>0 AND pr.typ='W' 
		AND nowa_wartosc IS NULL AND we.kraj_przezn ='ZZ'