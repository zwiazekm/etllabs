CREATE VIEW wald.v_widelki_RAPORT_1
AS
SELECT     --TOP 100 PERCENT 
					CASE znak WHEN 'masa_intr' THEN 'MASA INTRASTAT' WHEN 'ujm_intr' THEN 'UJM INTRASTAT' WHEN 'ujm_sad' THEN 'UJM EKSTARSTAT'
                       ELSE znak END AS ZNAK, CASE typ WHEN 'P' THEN 'PRZYWÓZ' WHEN 'W' THEN 'WYWÓZ' ELSE typ END AS TYP, COUNT(*) 
                      AS ILOŚĆ_REKORDÓW, GETDATE() AS kiedy
FROM         [wald].[widelki_poprawione_rekordy]
GROUP BY znak, typ
--ORDER BY COUNT(*) DESC