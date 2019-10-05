CREATE PROCEDURE [dbo].[Administracja_DodajOkresSprawozdawczy]
	(
	@Miesiac				int = null,
	@Kwartal				int = null,
	@Rok					int,
	@Aktywny				bit,
	@FormatkaKod			nvarchar(8),
	@OkresSprawozdawczyId	int = null
	)

AS
	BEGIN

	IF (@OkresSprawozdawczyId is null) 
	BEGIN

		INSERT INTO OkresSprawozdawczy
			(
				Miesiac,
				Kwartal,
				Rok,
				Aktywny,
				FormatkaKod
			)
			VALUES
			(
				@Miesiac,
				@Kwartal,
				@Rok,
				@Aktywny,
				@FormatkaKod
			)

			select scope_identity();

	END
	ELSE
	BEGIN


		UPDATE
			OkresSprawozdawczy
		SET
			Miesiac = @Miesiac,
			Rok = @Rok,
			Kwartal = @Kwartal,
			Aktywny = @Aktywny,
			FormatkaKod = @FormatkaKod
		WHERE
			ID = @OkresSprawozdawczyId

	END

	END
RETURN 0