CREATE VIEW gust.komunikat_1
AS
SELECT     zrodlo, COUNT(*) AS ilosc
FROM         gust.Sprawdzenie_poprawnosci
GROUP BY zrodlo