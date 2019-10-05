CREATE VIEW gust.V1_kurs_usd
AS
SELECT     [RokMc], [kurs]
	, dbo.KonwertujOkresNaMMYY(RokMc) as [miesiac_rok]
FROM         gust.kurs_usd_zbior