CREATE PROCEDURE [zef2].[Set_ProcName_and_uid_in_PismoXML]
AS

BEGIN
	SET NOCOUNT ON;
		 UPDATE [zef2].[Pismo_XML]
		   SET 
			  [ProcName] = 
			   (CASE    
					WHEN xDaneXML.exist('(/PISMO_XML/@proc_name)[1]') = 1
					THEN
						xDaneXML.value('(/PISMO_XML/@proc_name)[1]', 'nvarchar(50)')
					 ELSE
						'BRAK'
				END),
			  [uid] = 
			   (CASE  
					WHEN xDaneXML.exist('(/PISMO_XML/@uid)[1]') = 1
					THEN
						xDaneXML.value('(/PISMO_XML/@uid)[1]', 'nvarchar(50)')
					ELSE
						'BRAK'
				END),
				[DataZlozeniaDeklaracji] = 
			   (CASE    
					WHEN xDaneXML.exist('(/PISMO_XML/@submit_date)[1]') = 1
					THEN
						xDaneXML.value('(/PISMO_XML/@submit_date)[1]', 'nvarchar(200)')
					 ELSE
						'BRAK'
				END)
				WHERE [ProcName] IS NULL OR [DataZlozeniaDeklaracji] IS NULL

END