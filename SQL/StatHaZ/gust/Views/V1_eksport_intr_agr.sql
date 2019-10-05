CREATE VIEW gust.V1_eksport_intr_agr
AS
SELECT     gust.tbl_wynikowe.CN AS ek_pcn, ' ' AS ek_zp, gust.tbl_wynikowe.CN AS ek_pcnp, gust.tbl_wynikowe.kraj_przeznaczenia, 
                      gust.tbl_wynikowe.REGON AS ek_odbiorca, gust.tbl_wynikowe.NIP AS ek_nip, gust.tbl_wynikowe.miesiac_rok AS ek_miesiac_rok, 
                      gust.tbl_wynikowe.Rodzaj_transakcji AS ek_rodzaj_transakcji, gust.tbl_wynikowe.Rodzaj_transportu AS ek_kod_transportu, 
                      gust.tbl_wynikowe.warunki_dostawy AS ek_kod_warunkow_dostawy, gust.tbl_wynikowe.Izba AS ek_kod_izby_celnej, 
                      gust.tbl_wynikowe.Procedura AS ek_kod_procedury_celnej, '1' AS ek_znacznik_kategorii_progowej, gust.tbl_wynikowe.masa AS ek_masa_netto, 
                      gust.tbl_wynikowe.ilosc, gust.tbl_wynikowe.wartosc_zl AS ek_wartosc_stat_zl, 
                      RIGHT('               ' + ISNULL(CAST(CAST(CAST(gust.tbl_wynikowe.wartosc_zl AS numeric(12)) / gust.V1_kurs_usd.kurs AS numeric(12)) AS varchar(15)), 
                      '0'), 15) AS ek_wartosc_stat_usd, RIGHT('               ' + ISNULL(CAST(CAST(CAST(gust.tbl_wynikowe.wartosc_zl AS numeric(12)) 
                      / gust.V1_kurs_eur.kurs AS numeric(12)) AS varchar(15)), '0'), 15) AS ek_wartosc_stat_eur, gust.tbl_wynikowe.wartosc_zl AS ek_wartosc_faktury, NULL 
                      AS ek_iddoknr, NULL AS ek_id_dok, NULL AS ek_iddoknr_pozid, NULL AS ek_id_dok_pozid, NULL AS ek_id
FROM         gust.tbl_wynikowe LEFT OUTER JOIN
                      gust.V1_kurs_eur ON gust.tbl_wynikowe.miesiac_rok = gust.V1_kurs_eur.RokMc LEFT OUTER JOIN
                      gust.V1_kurs_usd ON gust.tbl_wynikowe.miesiac_rok = gust.V1_kurs_usd.RokMc
WHERE     (gust.tbl_wynikowe.Typ = 'W') AND (gust.tbl_wynikowe.zn_kategorii_progowej = '1')