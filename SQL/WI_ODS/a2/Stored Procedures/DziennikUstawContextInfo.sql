CREATE PROCEDURE [a2].[DziennikUstawContextInfo]
	@ContextInfoText varchar(16)
AS
	declare @ci varbinary(128) = cast(@ContextInfoText as varbinary(128));
	IF EXISTS(SELECT SPID FROM [a2].DziennikContextInfo WHERE SPID = @@SPID)
		UPDATE [a2].DziennikContextInfo
		SET ContextInfo = @ci
		WHERE SPID = @@SPID;
	ELSE
		INSERT INTO [a2].DziennikContextInfo (SPID, ContextInfo) 
		VALUES (@@SPID, @ci);

	EXEC [a2].DziennikWpisInfo @ContextInfoText, @@PROCID;

RETURN 0