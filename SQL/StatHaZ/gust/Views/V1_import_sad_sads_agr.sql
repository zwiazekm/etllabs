CREATE VIEW gust.V1_import_sad_sads_agr
AS
SELECT     gust.tbl_wynikowe.CN + '00' AS im_pcn, ' ' AS im_zp, gust.tbl_wynikowe.CN + '00' AS im_pcnp, gust.tbl_wynikowe.kraj_pochodzenia, 
                      gust.tbl_wynikowe.kraj_wysylki, '  ' AS im_kod_kraju_zakupu, gust.tbl_wynikowe.REGON AS im_odbiorca, 
                      gust.tbl_wynikowe.miesiac_rok AS im_miesiac_rok, gust.tbl_wynikowe.Rodzaj_transakcji AS im_rodzaj_transakcji, 
                      gust.tbl_wynikowe.Rodzaj_transportu AS im_kod_transportu_g, gust.tbl_wynikowe.Rodzaj_transportu AS im_kod_transportu_w, 
                      gust.tbl_wynikowe.warunki_dostawy AS im_kod_warunkow_dostawy, gust.tbl_wynikowe.Izba AS im_kod_izby_celnej, 
                      gust.tbl_wynikowe.Procedura AS im_kod_procedury_celnej, 'PLN' AS im_kod_waluty, ISNULL(gust.tbl_wynikowe.kod_kraju_srodka_transportu, '  ') 
                      AS im_kod_kraju_srodka_transportu, '0' AS im_kontener, 100 AS im_kod_preferencji, gust.tbl_wynikowe.masa AS ek_masa_netto, 
                      gust.tbl_wynikowe.masa AS ek_masa_brutto, gust.tbl_wynikowe.ilosc AS ek_ilosc, gust.tbl_wynikowe.wartosc_zl AS ek_wartosc_stat_zl, 
                      RIGHT('               ' + ISNULL(CAST(CAST(CAST(gust.tbl_wynikowe.wartosc_zl AS numeric(12)) / gust.V1_kurs_usd.kurs AS numeric(12)) AS varchar(15)), 
                      '0'), 15) AS ek_wartosc_stat_usd, RIGHT('               ' + ISNULL(CAST(CAST(CAST(gust.tbl_wynikowe.wartosc_zl AS numeric(12)) 
                      / gust.V1_kurs_eur.kurs AS numeric(12)) AS varchar(15)), '0'), 15) AS ek_wartosc_stat_eur, 
                      RIGHT('               ' + ISNULL(CAST(CAST(CAST(gust.tbl_wynikowe.wartosc_zl AS numeric(12)) / gust.V1_kurs_eur.kurs AS numeric(12)) AS varchar(15)), 
                      '0'), 15) AS ek_wartosc_pozycji
FROM         gust.tbl_wynikowe 
INNER JOIN gust.V1_kurs_usd ON gust.tbl_wynikowe.miesiac_rok = gust.V1_kurs_usd.RokMc 
INNER JOIN gust.V1_kurs_eur ON gust.tbl_wynikowe.miesiac_rok = gust.V1_kurs_eur.RokMc
WHERE     (gust.tbl_wynikowe.Przeplyw = 'SAD') AND (gust.tbl_wynikowe.Typ = 'P')