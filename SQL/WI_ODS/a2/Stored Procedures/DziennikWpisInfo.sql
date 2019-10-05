CREATE PROCEDURE [a2].[DziennikWpisInfo]
	@Info varchar(max),
	@ProcId int = NULL
AS

	DECLARE @ContextInfo VARBINARY(128) = null;
	SELECT @ContextInfo = ContextInfo
	FROM [a2].DziennikContextInfo
	WHERE SPID = @@SPID;

	INSERT INTO [a2].Dziennik (Data, [Status], ContextInfo, Procedura, Poziom, Informacja, SPID, [Login])
	VALUES (GETDATE(), 'I', @ContextInfo, @ProcId, @@NESTLEVEL-1, @Info, @@SPID, SUSER_NAME());

RETURN @@IDENTITY