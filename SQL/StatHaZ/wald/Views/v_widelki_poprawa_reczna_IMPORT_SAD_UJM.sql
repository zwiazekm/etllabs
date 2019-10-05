CREATE  VIEW wald.v_widelki_poprawa_reczna_IMPORT_SAD_UJM	 AS

SELECT --TOP 100 PERCENT  
znak, 
typ, 
tabela, 
bledna_wartosc, 
nowa_wartosc, 
[idDokNr], 
[idDokNr_pozid], 
kod_towarowy, 
kraj_poch_przezn AS kraj_poch ,
wartosc_fakt_stat
FROM [wald].[widelki_poprawione_rekordy]
WHERE	znak='ujm_sad' AND typ='P' AND nowa_wartosc IS NULL  AND wartosc_fakt_stat<>0
--ORDER BY kod_towarowy