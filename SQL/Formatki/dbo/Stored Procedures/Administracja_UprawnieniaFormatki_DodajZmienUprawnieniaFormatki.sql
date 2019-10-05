CREATE PROCEDURE [dbo].[Administracja_UprawnieniaFormatki_DodajZmienUprawnieniaFormatki]
(

	@Id					int = null,
	@FormatkaKod		nvarchar(5) = null,
	@SekcjaId			int = null,
	@RolaUzytkownikaId	int,
	@Uprawnienia		varchar(10)


)
AS
	

	IF (@Id is null)
	BEGIN

		INSERT INTO  FormatkaUprawnienia
		(
			FormatkaKod,
			RolaUzytkownikaId,
			SekcjaId,
			Uprawnienia
		)
		VALUES
		(
			@FormatkaKod,
			@RolaUzytkownikaId,
			@SekcjaId,
			@Uprawnienia
		)

		select SCOPE_IDENTITY()

	END
	ELSE
	BEGIN


		UPDATE FormatkaUprawnienia
		SET
			FormatkaKod = @FormatkaKod,
			RolaUzytkownikaId = @RolaUzytkownikaId,
			SekcjaId = @SekcjaId,
			Uprawnienia = @Uprawnienia
		WHERE
			Id = @Id
			
		select @@ROWCOUNT

	END

RETURN 0