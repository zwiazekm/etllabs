CREATE PROCEDURE [dbo].[Administracja_Jednostki_UsunJednostke]
	@JednostkaId	int
AS
	DELETE FROM StrukturaOrganizacyjna where JednostkaId = @JednostkaId
	select @@ROWCOUNT