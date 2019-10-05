
CREATE VIEW gust.komunikat
AS
SELECT     zrodlo, ilosc, CASE WHEN
                          (SELECT     COUNT(*)
                            FROM          gust.komunikat_1
                            WHERE      zrodlo = 'Arkusz XLS') <> 0 AND zrodlo = 'Arkusz XLS' THEN 'Jest blad w arkuszu Excel, liczba błędów: ' + CAST
                          ((SELECT     ilosc
                              FROM         gust.komunikat_1
                              WHERE     zrodlo = 'ARKUsz Xls') AS Nvarchar(50)) WHEN
                          (SELECT     COUNT(*)
                            FROM          gust.komunikat_1
                            WHERE      zrodlo = 'Plik TXT') <> 0 AND zrodlo = 'Plik TXT' THEN 'Jest blad w pliku tekstowym, liczba błędów: ' + CAST
                          ((SELECT     ilosc
                              FROM         gust.komunikat_1
                              WHERE     zrodlo = 'Plik TXT') AS Nvarchar(50)) WHEN
                          (SELECT     COUNT(*)
                            FROM          gust.komunikat_1
                            WHERE      zrodlo = 'Reczne_wprowadzenie') <> 0 AND 
                      zrodlo = 'Reczne_wprowadzenie' THEN 'Powstał błąd podczas ręcznego wprowadzania, liczba błędów: ' + CAST
                          ((SELECT     ilosc
                              FROM         gust.komunikat_1
                              WHERE     zrodlo = 'Reczne_wprowadzenie') AS Nvarchar(50)) WHEN
                          (SELECT     COUNT(*)
                            FROM          gust.komunikat_1
                            WHERE      zrodlo = 'Plik XML') <> 0 AND zrodlo = 'Plik XML' THEN 'Jest blad w pliku tekstowym, liczba błędów: ' + CAST
                          ((SELECT     ilosc
                              FROM         gust.komunikat_1
                              WHERE     zrodlo = 'Plik XML') AS Nvarchar(50)) ELSE 'Brak błędu' END AS Status
FROM         gust.komunikat_1
UNION ALL
SELECT     'Reczne_wprowadzenie', NULL, 'Poprawny_plik_zasilający'
WHERE     (SELECT     COUNT(*)
                       FROM          gust.komunikat_1
                       WHERE      zrodlo = 'Reczne_wprowadzenie') = 0
UNION ALL
SELECT     'Plik TXT', NULL, 'Poprawny_plik_zasilający TXT'
WHERE     (SELECT     COUNT(*)
                       FROM          gust.komunikat_1
                       WHERE      zrodlo = 'Plik TXT') = 0
UNION ALL
SELECT     'Arkusz XLS', NULL, 'Poprawny_plik_zasilający XLS'
WHERE     (SELECT     COUNT(*)
                       FROM          gust.komunikat_1
                       WHERE      zrodlo = 'Arkusz XLS') = 0
UNION ALL
SELECT     'Plik XML', NULL, 'Poprawny_plik_zasilający XML'
WHERE     (SELECT     COUNT(*)
                       FROM          gust.komunikat_1
                       WHERE      zrodlo = 'Plik XML') = 0