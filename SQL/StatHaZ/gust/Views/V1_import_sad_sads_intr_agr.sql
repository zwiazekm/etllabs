CREATE VIEW gust.V1_import_sad_sads_intr_agr
AS
SELECT     gust.tbl_wynikowe.CN AS im_pcn, ' ' AS im_zp, gust.tbl_wynikowe.CN AS im_pcnp, gust.tbl_wynikowe.kraj_pochodzenia, gust.tbl_wynikowe.kraj_wysylki, 
                      gust.tbl_wynikowe.REGON AS im_odbiorca, gust.tbl_wynikowe.miesiac_rok AS im_miesiac_rok, 
                      gust.tbl_wynikowe.Rodzaj_transakcji AS im_rodzaj_transakcji, gust.tbl_wynikowe.Rodzaj_transportu AS im_kod_transportu, 
                      gust.tbl_wynikowe.warunki_dostawy AS im_kod_warunkow_dostawy, gust.tbl_wynikowe.Izba AS im_kod_izby_celnej, 
                      gust.tbl_wynikowe.Procedura AS im_kod_procedury_celnej, gust.tbl_wynikowe.zn_kategorii_progowej AS im_znacznik_kategorii_progowej, 
                      gust.tbl_wynikowe.masa AS im_masa_netto, gust.tbl_wynikowe.ilosc AS im_ilosc, gust.tbl_wynikowe.wartosc_zl AS im_wartosc_stat_zl, 
                      RIGHT('               ' + ISNULL(CAST(CAST(CAST(gust.tbl_wynikowe.wartosc_zl AS numeric(12)) / gust.V1_kurs_usd.kurs AS numeric(12)) AS varchar(15)), 
                      '0'), 15) AS im_wartosc_stat_usd, RIGHT('               ' + ISNULL(CAST(CAST(CAST(gust.tbl_wynikowe.wartosc_zl AS numeric(12)) 
                      / gust.V1_kurs_eur.kurs AS numeric(12)) AS varchar(15)), '0'), 15) AS im_wartosc_stat_eur
FROM         gust.tbl_wynikowe 
INNER JOIN   gust.V1_kurs_usd ON gust.tbl_wynikowe.miesiac_rok = gust.V1_kurs_usd.RokMc 
INNER JOIN   gust.V1_kurs_eur ON gust.tbl_wynikowe.miesiac_rok = gust.V1_kurs_eur.RokMc
WHERE     (gust.tbl_wynikowe.Typ = 'P')