CREATE   VIEW wald.CN_MASA_WARTOSC_ILOSC_Intr
AS
SELECT     *
FROM         wald.wal_dgt_kopia_istat_dekl_wynik_poz
WHERE     (kod_towarowy = CONVERT(varchar, masa_netto) OR
                      kod_towarowy = CONVERT(varchar, uzup_jm) OR
                      kod_towarowy = CONVERT(varchar, wartosc_stat) OR
                      kod_towarowy = CONVERT(varchar, wartosc_faktury))
AND stat IS NULL
and convert(varchar,[id_dok])+convert(varchar,[PozId]) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from top_widoki_arch)