CREATE PROCEDURE [dbo].[Administracja_SekcjeKomorek_UsunSekcjeKomorki]
(
	@JednostkaOrgId int,
	@SekcjaId	int
)
AS

	DELETE FROM
		SekcjeDlaKomorek
	WHERE
		JednostkaOrgId = @JednostkaOrgId AND
		SekcjaId = @SekcjaId

	SELECT @@ROWCOUNT