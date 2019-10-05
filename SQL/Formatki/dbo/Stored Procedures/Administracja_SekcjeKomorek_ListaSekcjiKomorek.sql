CREATE PROCEDURE [dbo].[Administracja_SekcjeKomorek_ListaSekcjiKomorek]
(
	@KodFormularza			varchar(5)
)
AS
	
	BEGIN

		SELECT
			StrukturaOrganizacyjna.JednostkaId,
			StrukturaOrganizacyjna.KodPocztowy,
			StrukturaOrganizacyjna.KodUrzedu,
			StrukturaOrganizacyjna.KodUrzeduNadrzedny,
			StrukturaOrganizacyjna.Kraj,
			StrukturaOrganizacyjna.Miejscowosc,
			StrukturaOrganizacyjna.NazwaKrotka,
			StrukturaOrganizacyjna.NazwaPelna,
			FormatkaSekcje.LP,
			FormatkaSekcje.Nazwa,
			FormatkaSekcje.SekcjaId,
			FormatkaSekcje.SekcjaKod
		FROM	
			SekcjeDlaKomorek 
				INNER JOIN FormatkaSekcje on SekcjeDlaKomorek.SekcjaId = FormatkaSekcje.SekcjaId
				INNER JOIN StrukturaOrganizacyjna on SekcjeDlaKomorek.JednostkaOrgId = StrukturaOrganizacyjna.JednostkaId
		WHERE
			FormatkaSekcje.FormatkaKod = @KodFormularza
		ORDER BY
			FormatkaSekcje.SekcjaId, StrukturaOrganizacyjna.KodUrzedu

	END