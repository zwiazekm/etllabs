CREATE PROCEDURE [dbo].[Jednostki_ListaJednostekUzytkownika]
	@IdUzytkownika		int
AS

BEGIN

	WITH JU AS	--Jednostki Uzytkownika
	(
		SELECT UJ.JednostkaOrgId
		FROM UzytkownikJednostka as UJ 
		WHERE UJ.UzytkownikId = @IdUzytkownika
	)
	, SoTree (KodUrzedu, JednostkaId, Poziom, Sciezka)
	AS
	(
	-- Anchor member definition
		SELECT so.KodUrzedu, so.JednostkaId,
			0 AS Poziom, 
			cast(so.KodUrzedu as varchar(80))
		FROM dbo.StrukturaOrganizacyjna AS so
		INNER JOIN JU ON JU.JednostkaOrgId = so.JednostkaId
		UNION ALL
	-- Recursive member definition
		SELECT so.KodUrzedu, so.JednostkaId,
			Poziom + 1, 
			cast(n.Sciezka + '/' + so.KodUrzedu as varchar(80))
		FROM dbo.StrukturaOrganizacyjna AS so
		INNER JOIN SoTree AS n ON so.KodUrzeduNadrzedny = n.KodUrzedu
	)

	-- Statement that executes the CTE
	SELECT so.JednostkaId, so.KodUrzedu, so.Miejscowosc, so.NazwaPelna as NazwaKrotka, so.NazwaPelna, so.Rodzaj, so.Ulica, 
		Poziom, Sciezka, 
		'[' + so.KodUrzedu + '] ' + so.NazwaPelna as NazwaWyswietlana
	FROM SoTree
	INNER JOIN dbo.StrukturaOrganizacyjna AS so ON so.JednostkaId = SoTree.JednostkaId

END