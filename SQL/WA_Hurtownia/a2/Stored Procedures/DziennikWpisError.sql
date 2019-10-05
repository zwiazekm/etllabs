CREATE PROCEDURE [a2].[DziennikWpisError]
	@Info varchar(1900),
	@ProcId int = NULL
AS
	DECLARE @ContextInfo VARBINARY(128) = null;
	SELECT @ContextInfo = ContextInfo
	FROM a2.DziennikContextInfo
	WHERE SPID = @@SPID;

	INSERT INTO a2.Dziennik (Data, [Status], ContextInfo, Procedura, Poziom, Informacja, SPID)
	VALUES (GETDATE(), 'E', @ContextInfo, @ProcId, @@NESTLEVEL-1, @Info, @@SPID);
	
	DECLARE @Id BIGINT = @@IDENTITY;

	PRINT CONCAT('[ERR] Procedura [' + OBJECT_NAME(@ProcId) + ']: ', @Info);

RETURN @Id