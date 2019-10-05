CREATE PROCEDURE [dbo].[Uzytkownik_UzytkownikUsun]
	@UzytkownikID	int
AS

	DELETE FROM Uzytkownik WHERE UzytkownikId = @UzytkownikID

	select @@ERROR