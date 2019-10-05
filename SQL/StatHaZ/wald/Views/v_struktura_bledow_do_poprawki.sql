
CREATE VIEW [wald].[v_struktura_bledow_do_poprawki]
AS
SELECT --TOP 100 PERCENT    
bd_rodzaj AS [Rodzaj błędu],
bd_bledna_wartosc AS [Błędna wartość], 
bd_tabela AS [Lokalizacja błędu],

/**CASE
	WHEN bd_tabela='dgv_kopia_v2_sad_dpdz_tow' THEN 'dgv_kopia_v2_sad_dpdz_tow'
	WHEN bd_tabela='dgv_kopia_v2_dok_sad' THEN 'SAD - dgv_kopia_v2_dok_sad'
	WHEN bd_tabela='dgv_kopia_v2_sad_transport' THEN 'SAD - dgv_kopia_v2_sad_transport'
	WHEN bd_tabela='dgv_kopia_istat_dekl_wynik_poz' THEN 'INTRASTAT - dgv_kopia_istat_dekl_wynik_poz'
ELSE bd_tabela 
END AS "Lokalizacja błędu",**/
COUNT(bd_rodzaj) AS Ilość

FROM         
wald.dgt_bledne_dane
WHERE
(bd_nowa_wartosc IS NULL) AND (ISNULL(bd_do_usuniecia,'')!='T')
GROUP BY 
bd_rodzaj, bd_tabela, bd_bledna_wartosc
--ORDER BY
--bd_rodzaj, COUNT(bd_tabela) DESC