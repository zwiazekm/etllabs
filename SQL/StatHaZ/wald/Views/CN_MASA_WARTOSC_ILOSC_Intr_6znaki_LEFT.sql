

CREATE  VIEW wald.CN_MASA_WARTOSC_ILOSC_Intr_6znaki_LEFT
AS
SELECT     *
FROM         wald.wal_dgt_kopia_istat_dekl_wynik_poz
WHERE     stat IS NULL AND
(
left(kod_towarowy, 6) = left(convert(varchar, masa_netto), 6) or 
left(kod_towarowy, 6) = left(convert(varchar, uzup_jm), 6) or
left(kod_towarowy, 6) = left(convert(varchar, wartosc_stat), 6) or
left(kod_towarowy, 6) = left(convert(varchar, wartosc_faktury), 6)
)
and convert(varchar,[id_dok])+convert(varchar,[PozId]) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from top_widoki_arch)