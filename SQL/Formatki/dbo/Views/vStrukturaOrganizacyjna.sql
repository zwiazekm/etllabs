CREATE VIEW [dbo].[vStrukturaOrganizacyjna]
AS
SELECT 
	SO.JednostkaId,
	SO.KodPocztowy,
	SO.KodUrzedu,
	SO.KodUrzeduNadrzedny,
	SO.Kraj,
	SO.Miejscowosc,
	SO.NazwaKrotka,
	SO.NazwaPelna,
	'[' + SO.KodUrzedu + '] ' + SO.NazwaPelna as NazwaWyswietlana
	FROM dbo.StrukturaOrganizacyjna as SO