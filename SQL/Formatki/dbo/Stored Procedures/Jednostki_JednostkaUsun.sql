CREATE PROCEDURE [dbo].[Jednostki_JednostkaUsun]
	@JednostkaId	int
AS
	DELETE FROM StrukturaOrganizacyjna where JednostkaId = @JednostkaId
	select @@ERROR