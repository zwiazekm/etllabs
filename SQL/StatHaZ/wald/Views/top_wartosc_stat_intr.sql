

CREATE VIEW wald.top_wartosc_stat_intr
AS
SELECT     --TOP 100 PERCENT 
stat, koment, 
id_dok, pozid, 
wartosc_stat, 
masa_netto, 
uzup_jm, 
CAST(CAST(wartosc_stat / CASE WHEN masa_netto=0 THEN NULL 
			 ELSE masa_netto END AS FLOAT)AS NUMERIC(38,2)) AS wartosc_za_kg, 
CAST(CAST(wartosc_stat / CASE WHEN uzup_jm=0 THEN NULL
			 ELSE uzup_jm END AS FLOAT)AS NUMERIC(38,2)) AS wartosc_szt,
opis_towaru, 
kod_towarowy

FROM         wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR
--ORDER BY
--wartosc_stat DESC