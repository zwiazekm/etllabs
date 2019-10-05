CREATE VIEW wald.v_widelki_POPRAWIONE_REKORDY_SAD_UJM AS
SELECT 
znak, 
typ, 
tabela, 
bledna_wartosc, 
nowa_wartosc, 
[idDokNr], 
[idDokNr_pozid], 
kod_towarowy, 
kraj_poch_przezn AS kraj_poch,
wartosc_fakt_stat, 
generacjaId, 
uname, 
bd_pk 
FROM	[wald].[widelki_poprawione_rekordy]
WHERE	znak='ujm_sad'  AND nowa_wartosc IS NOT NULL  AND ISNULL(bledna_wartosc,0)<>nowa_wartosc