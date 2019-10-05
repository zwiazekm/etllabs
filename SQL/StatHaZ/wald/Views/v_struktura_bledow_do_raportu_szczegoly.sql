CREATE VIEW [wald].[v_struktura_bledow_do_raportu_szczegoly] AS
SELECT 
--TOP 100 PERCENT     
bd_rodzaj, 
bd_bledna_wartosc, 
bd_nowa_wartosc, 
CASE 
	WHEN bd_typ = 'E' THEN 'ECS' 
	WHEN bd_typ = 'I' THEN 'INTRASTAT' 
	WHEN bd_typ = 'S' THEN 'SAD' 
	ELSE bd_typ END AS typ, 
CASE 
	WHEN bd_do_usuniecia IS NULL THEN 'mapowanie'
	WHEN bd_do_usuniecia = 'T' THEN 'usunieto'
	ELSE bd_do_usuniecia END AS akcja,
MONTH(GETDATE()) - 1 AS miesiac, 
YEAR(GETDATE()) AS rok
FROM         
wald.dgt_bledne_dane
GROUP BY 
bd_rodzaj, 
bd_bledna_wartosc, 
bd_nowa_wartosc, 
bd_typ, 
bd_do_usuniecia
--ORDER BY
--typ,
--bd_rodzaj