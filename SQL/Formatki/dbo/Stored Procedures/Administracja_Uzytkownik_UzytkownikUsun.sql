CREATE PROCEDURE [dbo].[Administracja_Uzytkownik_UzytkownikUsun]
	@UzytkownikID	int
AS

	DELETE FROM Uzytkownik WHERE UzytkownikId = @UzytkownikID

	select @@ROWCOUNT