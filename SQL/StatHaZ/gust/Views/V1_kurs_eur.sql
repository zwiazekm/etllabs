CREATE VIEW gust.V1_kurs_eur
AS
SELECT     [RokMc], [kurs]
	, dbo.KonwertujOkresNaMMYY(RokMc) as [miesiac_rok]
FROM         gust.kurs_eur_zbior