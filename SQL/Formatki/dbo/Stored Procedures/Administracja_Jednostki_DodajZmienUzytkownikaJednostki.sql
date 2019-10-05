CREATE PROCEDURE [dbo].[Administracja_Jednostki_DodajZmienUzytkownikaJednostki]
(
	@JednostkaOrgId		int,
	@UzytkownikId		int,
	@JednostkaOrgId_OLD int = null,
	@UzytkownikId_OLD	int = null
)
AS

	IF ((@JednostkaOrgId_OLD is null) and (@UzytkownikId_OLD is null))
	BEGIN

		INSERT INTO UzytkownikJednostka
		(
			JednostkaOrgId, 
			UzytkownikId
		)
		VALUES
		(
			@JednostkaOrgId,
			@UzytkownikId
		)

		SELECT @@ROWCOUNT
	END
	ELSE
	BEGIN

		UPDATE
			UzytkownikJednostka
		SET
			JednostkaOrgId = @JednostkaOrgId,
			UzytkownikId = @UzytkownikId
		WHERE
			JednostkaOrgId = @JednostkaOrgId_OLD AND
			UzytkownikId = @UzytkownikId_OLD


		SELECT @@ROWCOUNT

	END