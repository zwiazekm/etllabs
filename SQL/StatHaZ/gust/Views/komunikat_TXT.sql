
CREATE VIEW gust.komunikat_TXT
AS
SELECT     CASE WHEN [Status] IS NULL THEN 'Brak Błędów' ELSE [Status] END AS komunikat
FROM         gust.komunikat
WHERE     (zrodlo = N'Plik TXT')