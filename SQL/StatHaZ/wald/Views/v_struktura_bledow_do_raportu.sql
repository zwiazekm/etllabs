CREATE VIEW [wald].[v_struktura_bledow_do_raportu] AS
SELECT     --TOP 100 PERCENT 
		CASE WHEN bd_typ = 'E' THEN 'ECS' WHEN bd_typ = 'I' THEN 'INTRASTAT' WHEN bd_typ = 'S' THEN 'SAD' ELSE bd_typ END AS typ,
                       CASE WHEN bd_rodzaj IS NULL THEN 'do usuniecia' ELSE bd_rodzaj END AS bd_rodzaj, COUNT(CASE WHEN bd_rodzaj IS NULL 
                      THEN 'do usuniecia' ELSE bd_rodzaj END) AS Ilosc, MONTH(GETDATE()) - 1 AS miesiac, YEAR(GETDATE()) AS rok
FROM         wald.dgt_bledne_dane
GROUP BY bd_rodzaj, bd_typ
--ORDER BY bd_typ, COUNT(bd_rodzaj) DESC