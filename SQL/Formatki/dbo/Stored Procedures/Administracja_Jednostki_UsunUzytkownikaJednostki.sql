CREATE PROCEDURE [dbo].[Administracja_Jednostki_UsunUzytkownikaJednostki]
(
	@JednostkaOrgId int,
	@UzytkownikId	int
)
AS

	DELETE FROM
		UzytkownikJednostka
	WHERE
		JednostkaOrgId = @JednostkaOrgId AND
		UzytkownikId = @UzytkownikId

	SELECT @@ROWCOUNT