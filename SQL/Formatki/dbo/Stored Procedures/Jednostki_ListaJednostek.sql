CREATE PROCEDURE [dbo].[Jednostki_ListaJednostek]
(
	@KodJednostki nvarchar(50)= null
)
	
AS
	SELECT 
	StrukturaOrganizacyjna.JednostkaId,
	StrukturaOrganizacyjna.KodPocztowy,
	StrukturaOrganizacyjna.KodUrzedu,
	StrukturaOrganizacyjna.KodUrzeduNadrzedny,
	StrukturaOrganizacyjna.Kraj,
	StrukturaOrganizacyjna.Miejscowosc,
	StrukturaOrganizacyjna.NazwaKrotka,
	StrukturaOrganizacyjna.NazwaPelna,
	StrukturaOrganizacyjna.Rodzaj,
	StrukturaOrganizacyjna.Ulica,
	StrukturaOrganizacyjna.last_modification_tm,
	StrukturaOrganizacyjna.valid_from,
	StrukturaOrganizacyjna.valid_to
	FROM
		dbo.StrukturaOrganizacyjna
	WHERE
		KodUrzedu = @KodJednostki or @KodJednostki is null