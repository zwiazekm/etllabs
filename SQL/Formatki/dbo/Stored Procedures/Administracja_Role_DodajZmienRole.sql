CREATE PROCEDURE [dbo].[Administracja_Role_DodajZmienRole]
(
@IDRoli		int = null,
@NazwaRoli	nvarchar(50)
)
AS

	IF (@IDRoli is null)
	BEGIN

		INSERT INTO RolaUzytkownika
			(NazwaRoli)
		VALUES
		(@NazwaRoli)

		select SCOPE_IDENTITY()

	END
	ELSE
	BEGIN
		UPDATE RolaUzytkownika
		SET
			NazwaRoli = @NazwaRoli
		WHERE
			RolaUzytkownikaId = @IDRoli

		select @@ROWCOUNT
	END