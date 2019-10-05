
CREATE VIEW gust.[KOMUNIKAT xls]
AS
SELECT     CASE WHEN [Status] IS NULL THEN 'Brak Błędów' ELSE [Status] END AS KOMUNIKAT
FROM         gust.komunikat
WHERE     (zrodlo = N'Arkusz XLS')