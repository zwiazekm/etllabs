CREATE VIEW wald.v_widelki_SZCZEG_STR_BLEDOW
AS
SELECT    znak AS znak, typ AS Expr2, 
	    isnull( bledna_wartosc, 'NULL') as bledna_wartosc,
	COUNT(*) AS Expr4
FROM         [wald].[widelki_poprawione_rekordy]
GROUP BY znak, typ, bledna_wartosc