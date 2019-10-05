CREATE VIEW gust.Sprawdzenie_poprawnosci
AS
SELECT DISTINCT 'Błędny symbol kraju' AS Rodzaj_błędu, Kraj_przeznaczenia AS Nazwa, COUNT(Kraj_przeznaczenia) AS Ilosc_wystapien, zrodlo
FROM         gust.Kody_CN_Sprawdzenie
WHERE     Kraj_przeznaczenia NOT IN
                          (SELECT     nazwa
                            FROM          gust.tbl_sl_kraje)
GROUP BY Kraj_przeznaczenia, zrodlo
UNION ALL
SELECT DISTINCT 'Błędny symbol kraju' AS Rodzaj_błędu, Kraj_pochodzenia AS Nazwa, COUNT(Kraj_pochodzenia) AS Ilosc_wystapien, zrodlo
FROM         gust.Kody_CN_Sprawdzenie
WHERE     Kraj_pochodzenia NOT IN
                          (SELECT     nazwa
                            FROM          gust.tbl_sl_kraje)
GROUP BY Kraj_pochodzenia, zrodlo
UNION ALL
SELECT DISTINCT 'Błędny symbol kraju' AS Rodzaj_błędu, Kraj_wysylki AS Nazwa, COUNT(Kraj_wysylki) AS Ilosc_wystapien, zrodlo
FROM         gust.Kody_CN_Sprawdzenie
WHERE     Kraj_wysylki NOT IN
                          (SELECT     nazwa
                            FROM          gust.tbl_sl_kraje)
GROUP BY Kraj_wysylki, zrodlo
UNION ALL
SELECT DISTINCT 'Błędny kod CN' AS Rodzaj_błędu, CN AS Nazwa, COUNT(CN) AS Ilosc_wystapien, zrodlo
FROM         gust.Kody_CN_Sprawdzenie
WHERE     CN NOT IN
                          (SELECT     kod_cn
                            FROM         gust.tbl_sl_taryfa_cn8)
GROUP BY CN, zrodlo
UNION ALL
SELECT DISTINCT 'Błędna data' AS Rodzaj_błędu, data AS Nazwa, COUNT(data) AS Ilosc_wystapien, zrodlo
FROM         gust.Kody_CN_Sprawdzenie
WHERE     substring(data, 1, 2) NOT IN ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12')OR
                      substring(data, 3,1) NOT  IN ('0','1', '2', '3', '4', '5', '6', '7', '8', '9') OR
	         substring(data, 4,1) NOT IN ('0','1', '2', '3', '4', '5', '6', '7', '8', '9')

GROUP BY data, zrodlo
UNION ALL
SELECT DISTINCT 'Brak kraju przeznaczenia/wysylki' AS Rodzaj_błędu, 'Brak nazwy' AS Nazwa, COUNT(*) AS Ilosc_wystapien, zrodlo
FROM         gust.Kody_CN_Sprawdzenie
WHERE     Kraj_przeznaczenia IS NULL AND Kraj_wysylki IS NULL
GROUP BY Kraj_pochodzenia, zrodlo
UNION ALL
SELECT DISTINCT 'Brak kraju pochodzenia' AS Rodzaj_błędu, 'Brak nazwy' AS Nazwa, COUNT(*) AS Ilosc_wystapien, zrodlo
FROM         gust.Kody_CN_Sprawdzenie
WHERE     Kraj_przeznaczenia IS NULL AND Kraj_wysylki IS NOT NULL AND Kraj_pochodzenia IS NULL
GROUP BY Kraj_pochodzenia, zrodlo
UNION ALL
SELECT DISTINCT 'Błędny symbol kraju' AS Rodzaj_błędu, [Kraj_srodka_transportu] AS Nazwa, COUNT([Kraj_srodka_transportu]) AS Ilosc_wystapien, zrodlo
FROM         gust.Kody_CN_Sprawdzenie
WHERE     [Kraj_srodka_transportu] NOT IN
                          (SELECT     nazwa
                            FROM          gust.tbl_sl_kraje)
GROUP BY [Kraj_srodka_transportu], zrodlo