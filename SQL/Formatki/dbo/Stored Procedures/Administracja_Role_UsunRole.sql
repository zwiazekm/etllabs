CREATE PROCEDURE [dbo].[Administracja_Role_UsunRole]
@IdRoli		int
AS
	DELETE FROM
		RolaUzytkownika
		WHERE
		RolaUzytkownikaId = @IdRoli

	SELECT @@ERROR