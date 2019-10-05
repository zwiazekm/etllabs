CREATE VIEW wald.v_widelki_poprawa_reczna_IMPORT_INTR_UJM	 AS

SELECT --TOP 100 PERCENT  
znak, 
typ, 
tabela, 
bledna_wartosc, 
nowa_wartosc, 
id_dok, 
id_dok_pozid, 
kod_towarowy, 
kraj_poch_przezn AS kraj_poch ,
wartosc_fakt_stat
FROM		widelki_poprawione_rekordy 
WHERE	znak='ujm_intr' AND typ='P' AND nowa_wartosc IS NULL  AND wartosc_fakt_stat<>0
--ORDER BY kod_towarowy