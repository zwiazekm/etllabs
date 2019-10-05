CREATE VIEW gust.widok_insert_danych
AS
SELECT     dz.[CN], dz.[ExtractDate], dz.flaga, 
                      tbl_sl_kraje_3.kod AS kraj_pochodzenia, tbl_sl_kraje_1.kod AS kraj_przeznaczenia, tbl_sl_kraje_4.kod AS kraj_srodka_transportu, 
                      tbl_sl_kraje_2.kod AS kraj_wysylki, dz.masa, dz.ilosc, 
                      dz.miesiac_rok, dz.wartosc_zl, dz.okres_od, 
                      dz.okres_do
FROM         gust.widok_tbl_dane_zrodlowe_kopia as dz LEFT OUTER JOIN
                      gust.tbl_sl_kraje tbl_sl_kraje_4 ON dz.kraj_srodka_transportu = tbl_sl_kraje_4.nazwa LEFT OUTER JOIN
                      gust.tbl_sl_kraje tbl_sl_kraje_2 ON dz.kraj_wysylki = tbl_sl_kraje_2.nazwa LEFT OUTER JOIN
                      gust.tbl_sl_kraje tbl_sl_kraje_1 ON dz.kraj_przeznaczenia = tbl_sl_kraje_1.nazwa LEFT OUTER JOIN
                      gust.tbl_sl_kraje tbl_sl_kraje_3 ON dz.kraj_pochodzenia = tbl_sl_kraje_3.nazwa