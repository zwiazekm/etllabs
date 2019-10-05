--========================================
--LukBub
--========================================

CREATE PROCEDURE [zef2].[RemoveXMLFromPismoXML]
	@ID_FROM int = null,
	@ID_TO int = null,
	@SYSTEM varchar(max) = null
AS
	IF (@ID_FROM is null)
	RAISERROR('Null values not allowed for @ID_FROM', 16, 1)
	ELSE IF (@ID_TO is null)
	RAISERROR ('Null values not allowed for @ID_TO', 16, 1)


	DECLARE @BeginID int = @ID_FROM;
	DECLARE @EndID int = @ID_TO;
	DECLARE @Proc_Name varchar(max) = @SYSTEM;
	

	SET XACT_ABORT ON;
	BEGIN TRANSACTION;
	BEGIN
	IF (@SYSTEM IS NOT NULL AND @BeginID IS NOT NULL AND @EndID IS NOT NULL)

		INSERT INTO [zef2].[Help_Pismo_XML]
			   ([DataDanych]
			   ,[ID_Pismo_xml]
			   ,[ProcName]
			   ,[IsDelete]
			   ,[DeleteDate])
		 SELECT [DataDanych]
			   ,[ID_Pismo_xml]
			   ,[ProcName]
			   ,'T'
			   ,GETDATE()
			   FROM zef2.Pismo_XML px
		   		WHERE (px.ID_Pismo_xml >= @BeginID AND px.ID_Pismo_xml <= @EndID) AND px.ProcName IN (@Proc_Name);

	ELSE IF(@SYSTEM IS NULL AND @BeginID IS NOT NULL AND @EndID IS NOT NULL)
		INSERT INTO [zef2].[Help_Pismo_XML]
			   ([DataDanych]
			   ,[ID_Pismo_xml]
			   ,[ProcName]
			   ,[IsDelete]
			   ,[DeleteDate])
		 SELECT [DataDanych]
			   ,[ID_Pismo_xml]
			   ,[ProcName]
			   ,'T'
			   ,GETDATE()
			   FROM zef2.Pismo_XML px
		   		WHERE (px.ID_Pismo_xml >= @BeginID AND px.ID_Pismo_xml <= @ID_TO)
	ELSE
		PRINT('Need to know the parameters')
		END

		BEGIN
		IF(@Proc_Name IS NOT NULL)

UPDATE [zef2].[Pismo_XML]
		   SET 
			  [xDaneXML] = null
			  WHERE ID_Pismo_xml >= @BeginID AND ID_Pismo_xml <= @EndID AND ProcName = @Proc_Name
		ELSE
		UPDATE [zef2].[Pismo_XML]
		   SET 
			  [xDaneXML] = null
			  WHERE ID_Pismo_xml >= @BeginID AND ID_Pismo_xml <= @EndID 
		END

	COMMIT TRANSACTION;
	PRINT('Command completed successfully')
RETURN 0