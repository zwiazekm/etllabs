CREATE PROCEDURE [stat].[DziennikUstawContextInfo]
	@ContextInfoText varchar(16)
AS
	declare @ci varbinary(128) = cast(@ContextInfoText as varbinary(128));
	IF EXISTS(SELECT SPID FROM stat.DziennikContextInfo WHERE SPID = @@SPID)
		UPDATE stat.DziennikContextInfo
		SET ContextInfo = @ci
		WHERE SPID = @@SPID;
	ELSE
		INSERT INTO stat.DziennikContextInfo (SPID, ContextInfo) 
		VALUES (@@SPID, @ci);

	EXEC stat.DziennikWpisInfo @ContextInfoText, @@PROCID;

RETURN 0