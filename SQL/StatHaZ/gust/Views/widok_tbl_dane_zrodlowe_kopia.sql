CREATE VIEW gust.widok_tbl_dane_zrodlowe_kopia as
SELECT [CN], [ExtractDate], flaga, ilosc, kraj_pochodzenia, kraj_przeznaczenia, kraj_srodka_transportu, kraj_wysylki, masa, miesiac_rok, wartosc_zl, '200601' okres_od, '200602' okres_do 
from gust.tbl_dane_zrodlowe