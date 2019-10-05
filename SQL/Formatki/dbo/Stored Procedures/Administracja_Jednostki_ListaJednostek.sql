CREATE PROCEDURE [dbo].[Administracja_Jednostki_ListaJednostek]
(
	@KodJednostki nvarchar(50)	= null
)
	
AS
	SELECT 
	V.JednostkaId,
	V.KodPocztowy,
	V.KodUrzedu,
	V.KodUrzeduNadrzedny,
	V.Kraj,
	V.Miejscowosc,
	V.NazwaKrotka,
	V.NazwaPelna,
	V.NazwaWyswietlana
	--,(SELECT TOP 1 JednostkaId FROM dbo.StrukturaOrganizacyjna as N where N.KodUrzedu = V.KodUrzeduNadrzedny) as JednostkaNadrzednaId
	FROM
		vStrukturaOrganizacyjna as V
	WHERE
		KodUrzedu = @KodJednostki or @KodJednostki is null
	ORDER BY KodUrzedu