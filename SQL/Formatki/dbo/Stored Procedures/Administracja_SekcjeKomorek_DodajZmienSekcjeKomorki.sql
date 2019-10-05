CREATE PROCEDURE [dbo].[Administracja_SekcjeKomorek_DodajZmienSekcjeKomorki]
(
	@JednostkaOrgId		int,
	@SekcjaId			int,
	@JednostkaOrgId_OLD int = null,
	@SekcjaId_OLD	int = null
)
AS

	IF ((@JednostkaOrgId_OLD is null) and (@SekcjaId_OLD is null))
	BEGIN

		INSERT INTO SekcjeDlaKomorek
		(
			JednostkaOrgId, 
			SekcjaId
		)
		VALUES
		(
			@JednostkaOrgId,
			@SekcjaId
		)

		SELECT @@ROWCOUNT
	END
	ELSE
	BEGIN

		UPDATE
			SekcjeDlaKomorek
		SET
			JednostkaOrgId = @JednostkaOrgId,
			SekcjaId = @SekcjaId
		WHERE
			JednostkaOrgId = @JednostkaOrgId_OLD AND
			SekcjaId = @SekcjaId_OLD


		SELECT @@ROWCOUNT

	END