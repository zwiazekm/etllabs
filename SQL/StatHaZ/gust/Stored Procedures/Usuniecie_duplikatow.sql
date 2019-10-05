CREATE PROCEDURE [gust].Usuniecie_duplikatow
AS

DELETE gust.tbl_wynikowe
  From gust.kopia_tbl_dane_zrodlowe
  Where gust.kopia_tbl_dane_zrodlowe.miesiac_rok = gust.tbl_wynikowe.miesiac_rok AND
	gust.kopia_tbl_dane_zrodlowe.[CN] = gust.tbl_wynikowe.CN AND
	gust.kopia_tbl_dane_zrodlowe.kraj_przeznaczenia = gust.tbl_wynikowe.kraj_przeznaczenia AND
	gust.kopia_tbl_dane_zrodlowe.kraj_przeznaczenia IS NOT NULL AND kopia_tbl_dane_zrodlowe.flaga='A'

DELETE gust.tbl_wynikowe
  From gust.kopia_tbl_dane_zrodlowe
  Where gust.kopia_tbl_dane_zrodlowe.miesiac_rok = gust.tbl_wynikowe.miesiac_rok AND
	gust.kopia_tbl_dane_zrodlowe.[CN]=gust.tbl_wynikowe.CN AND
	gust.kopia_tbl_dane_zrodlowe.kraj_wysylki=gust.tbl_wynikowe.kraj_wysylki AND
	gust.kopia_tbl_dane_zrodlowe.kraj_pochodzenia=gust.tbl_wynikowe.kraj_pochodzenia AND
	gust.kopia_tbl_dane_zrodlowe.kraj_pochodzenia IS NOT NULL AND gust.kopia_tbl_dane_zrodlowe.kraj_wysylki IS NOT NULL
	AND kopia_tbl_dane_zrodlowe.flaga='A'