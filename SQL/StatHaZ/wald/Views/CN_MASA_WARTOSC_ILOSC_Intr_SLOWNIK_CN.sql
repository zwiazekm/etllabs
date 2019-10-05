

CREATE  VIEW wald.CN_MASA_WARTOSC_ILOSC_Intr_SLOWNIK_CN AS

SELECT     *
FROM         wald.wal_dgt_kopia_istat_dekl_wynik_poz
WHERE     stat IS NULL AND (CONVERT(varchar, masa_netto) IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8_wszystkie_lata)

OR   CONVERT(varchar, uzup_jm) IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8_wszystkie_lata)

OR CONVERT(varchar, wartosc_stat) IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8_wszystkie_lata)
OR	CONVERT(varchar, wartosc_faktury) IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8_wszystkie_lata))
and convert(varchar,[id_dok])+convert(varchar,[PozId]) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from wald.top_widoki_arch)