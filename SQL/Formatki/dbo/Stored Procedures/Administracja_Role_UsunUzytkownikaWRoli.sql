CREATE PROCEDURE [dbo].[Administracja_Role_UsunUzytkownikaWRoli]
(
	@RolaId int,
	@UzytkownikId	int
)
AS

	DELETE FROM
		UzytkownikWRoli
	WHERE
		RolaUzytkownikaId = @RolaId AND
		UzytkownikId = @UzytkownikId

	SELECT @@ROWCOUNT