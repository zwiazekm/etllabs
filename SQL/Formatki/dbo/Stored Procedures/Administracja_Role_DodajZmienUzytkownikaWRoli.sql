CREATE PROCEDURE [dbo].[Administracja_Role_DodajZmienUzytkownikaWRoli]
(
	@RolaId				int,
	@UzytkownikId		int,
	@RolaId_OLD			int = null,
	@UzytkownikId_OLD	int = null
)
AS

	IF ((@RolaID_OLD is null) and (@UzytkownikId_OLD is null))
	BEGIN

		INSERT INTO UzytkownikWRoli
		(
			RolaUzytkownikaId, 
			UzytkownikId
		)
		VALUES
		(
			@RolaId,
			@UzytkownikId
		)

		SELECT @@ROWCOUNT
	END
	ELSE
	BEGIN

		UPDATE
			UzytkownikWRoli
		SET
			RolaUzytkownikaId = @RolaId,
			UzytkownikId = @UzytkownikId
		WHERE
			RolaUzytkownikaId = @RolaID_OLD AND
			UzytkownikId = @UzytkownikId_OLD


		SELECT @@ROWCOUNT

	END