CREATE  VIEW wald.v_widelki_poprawa_reczna_EKSPORT_INTR_MASA	 AS

SELECT  --TOP 100 PERCENT  
znak, 
typ, 
tabela, 
bledna_wartosc, 
nowa_wartosc, 
id_dok, 
id_dok_pozid, 
kod_towarowy, 
kraj_poch_przezn AS kraj_przezn ,
wartosc_fakt_stat
FROM		[wald].[widelki_poprawione_rekordy] 
WHERE	znak='masa_intr' AND typ='W' AND nowa_wartosc IS NULL  AND wartosc_fakt_stat<>0
--ORDER BY kod_towarowy