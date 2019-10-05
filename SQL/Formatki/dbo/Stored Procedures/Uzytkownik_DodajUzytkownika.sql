CREATE PROCEDURE [dbo].[Uzytkownik_DodajUzytkownika]
(
	@Login				nvarchar(256),
	@Imie				nvarchar(30),
	@Nazwisko			nvarchar(60),
	@UzytkownikId		int = null
	)
AS
	
BEGIN

	IF (@UzytkownikId is null) 
	BEGIN

		INSERT INTO Uzytkownik
			(
				[Login],
				Imie,
				Nazwisko
			)
		VALUES
			(
				@Login,
				@Imie,
				@Nazwisko
			)

		select scope_identity();

	END
	ELSE
	BEGIN

		Update
			Uzytkownik
		SET
			[Login] = @Login,
			Imie = @Imie,
			Nazwisko = @Nazwisko
		WHERE
			UzytkownikId = @UzytkownikId
				
		select @UzytkownikId

	END

END

RETURN