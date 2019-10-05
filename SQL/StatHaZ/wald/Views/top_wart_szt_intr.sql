﻿

CREATE VIEW wald.top_wart_szt_intr
AS
SELECT     --TOP 100 PERCENT 
stat,
koment, 
id_dok, 
pozid, 
wartosc_stat, 
wartosc_faktury,
masa_netto, 
uzup_jm, 
CAST(CAST(wartosc_faktury / CASE WHEN masa_netto=0 THEN NULL 
			 ELSE masa_netto END AS FLOAT)AS NUMERIC(38,2)) AS [wartosc za kg], 
CAST(CAST(wartosc_faktury / CASE WHEN uzup_jm=0 THEN NULL
			 ELSE uzup_jm END AS FLOAT)AS NUMERIC(38,2)) AS wartosc_szt,
CAST(CAST(masa_netto / CASE WHEN uzup_jm=0 THEN NULL
			 ELSE uzup_jm END AS FLOAT)AS NUMERIC(38,2)) AS szt_waży_w_pozycji,
opis_towaru, 
kod_towarowy, 
kraj_pochodzenia
--FROM         
--wald.wal_dgt_kopia_istat_dekl_wynik_poz
FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR
/*WHERE     
(CAST(CAST(wartosc_faktury / CASE WHEN uzup_jm=0 THEN NULL
			 ELSE uzup_jm END AS FLOAT)AS NUMERIC(38,2)) > 1200000)*/
--ORDER BY opis_towaru
--10 DESC