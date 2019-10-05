CREATE PROCEDURE [wald].p_widelki_DO_ARCHIWUM AS

INSERT INTO [wald].[widelki_POPRAWIONE_REKORDY_ARCH]
(znak, 
typ, 
tabela, 
bledna_wartosc, 
nowa_wartosc, 
idDokNr, 
id_dok, 
[idDokNr_pozid], 
id_dok_pozid, 
kod_towarowy, 
kraj_poch_przezn, 
wartosc, 
generacjaId)

SELECT
znak, 
typ, 
tabela, 
bledna_wartosc, 
nowa_wartosc, 
NULL, 
id_dok, 
NULL, 
id_dok_pozid, 
kod_towarowy, 
kraj_poch AS kraj_poch_przezn, 
wartosc_fakt_stat, 
generacjaId
FROM v_widelki_POPRAWIONE_REKORDY_INTR_MASA

UNION ALL

SELECT
znak, 
typ, 
tabela, 
bledna_wartosc, 
nowa_wartosc, 
NULL, 
id_dok, 
NULL, 
id_dok_pozid, 
kod_towarowy, 
kraj_poch AS kraj_poch_przezn, 
wartosc_fakt_stat,
generacjaId
FROM v_widelki_POPRAWIONE_REKORDY_INTR_UJM

UNION ALL

SELECT
znak, 
typ, 
tabela, 
bledna_wartosc, 
nowa_wartosc, 
[idDokNr],
NULL, 
[idDokNr_pozid],
NULL, 
kod_towarowy, 
kraj_poch AS kraj_poch_przezn, 
wartosc_fakt_stat,
generacjaId
FROM v_widelki_POPRAWIONE_REKORDY_SAD_UJM