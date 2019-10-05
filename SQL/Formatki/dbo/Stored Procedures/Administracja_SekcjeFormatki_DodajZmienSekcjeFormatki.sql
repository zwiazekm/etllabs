CREATE PROCEDURE [dbo].[Administracja_SekcjeFormatki_DodajZmienSekcjeFormatki]
(
	@SekcjaId			int = null,
	@FormatkaKod		varchar(5),
	@SekcjaKod			varchar(5),
	@Nazwa				varchar(200),
	@Lp					tinyint
)


AS

	IF (@SekcjaId is null)
	BEGIN

		INSERT INTO	FormatkaSekcje
				(
					FormatkaKod,
					LP,
					Nazwa,
					SekcjaKod
				)
			VALUES
				(
					@FormatkaKod,
					@Lp,
					@Nazwa,
					@SekcjaKod
				)

		SELECT SCOPE_IDENTITY();

	END
	ELSE
	BEGIN

		UPDATE FormatkaSekcje
		SET
			FormatkaKod = @FormatkaKod,
			LP = @Lp,
			Nazwa = @Nazwa,
			SekcjaKod = @SekcjaKod
		WHERE
			SekcjaId = @SekcjaId

		select @@ROWCOUNT;

	END


RETURN 0