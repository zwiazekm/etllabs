CREATE VIEW gust.V1_eksport_sad_sads_agr
AS
SELECT     gust.tbl_wynikowe.CN AS ek_pcn, ' ' AS ek_zp, gust.tbl_wynikowe.CN AS ek_pcnp, gust.tbl_wynikowe.kraj_przeznaczenia, 
                      ISNULL(gust.tbl_wynikowe.kraj_wysylki, 'PL') AS kraj_wysylki, '  ' AS ek_kod_kraju_sprzedazy, gust.tbl_wynikowe.REGON AS ek_odbiorca, 
                      gust.tbl_wynikowe.miesiac_rok AS ek_miesiac_rok, gust.tbl_wynikowe.Rodzaj_transakcji AS ek_rodzaj_transakcji, 
                      gust.tbl_wynikowe.Rodzaj_transportu AS ek_kod_transportu_g, gust.tbl_wynikowe.Rodzaj_transportu AS ek_kod_transportu_w, 
                      gust.tbl_wynikowe.warunki_dostawy AS ek_kod_warunkow_dostawy, gust.tbl_wynikowe.Izba AS ek_kod_izby_celnej, 
                      gust.tbl_wynikowe.Procedura AS ek_kod_procedury_celnej, 'PLN' AS ek_kod_waluty, ISNULL(gust.tbl_wynikowe.kod_kraju_srodka_transportu, '  ') 
                      AS ek_kod_kraju_srodka_transportu, '0' AS ek_kontener, gust.tbl_wynikowe.masa AS ek_masa_netto, gust.tbl_wynikowe.masa AS ek_masa_brutto, 
                      gust.tbl_wynikowe.ilosc AS ek_ilosc, gust.tbl_wynikowe.wartosc_zl AS ek_wartosc_stat_zl, 
                      RIGHT('               ' + ISNULL(CAST(CAST(CAST(gust.tbl_wynikowe.wartosc_zl AS numeric(12)) / gust.V1_kurs_usd.kurs AS numeric(12)) AS varchar(15)), 
                      '0'), 15) AS ek_wartosc_stat_usd, RIGHT('               ' + ISNULL(CAST(CAST(CAST(gust.tbl_wynikowe.wartosc_zl AS numeric(12)) 
                      / gust.V1_kurs_eur.kurs AS numeric(12)) AS varchar(15)), '0'), 15) AS ek_wartosc_stat_eur, RIGHT('               ' + ISNULL('0', '0'), 15) 
                      AS ek_wartosc_pozycji
FROM         gust.tbl_wynikowe INNER JOIN
                      gust.V1_kurs_usd ON gust.tbl_wynikowe.miesiac_rok = gust.V1_kurs_usd.miesiac_rok INNER JOIN
                      gust.V1_kurs_eur ON gust.tbl_wynikowe.miesiac_rok = gust.V1_kurs_eur.miesiac_rok
WHERE     (gust.tbl_wynikowe.Przeplyw = 'SAD') AND (gust.tbl_wynikowe.Typ = 'W')