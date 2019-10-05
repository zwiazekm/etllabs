-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-07-28
-- Description:	
-- =============================================

CREATE PROCEDURE [wpb].[MergeAllWPBFromStage]
AS
BEGIN
	SET NOCOUNT ON;
	
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB27_Dokument';
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB27_Pozycje';	
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB28_Dokument';
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB28_Pozycje';
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB28PR_Dokument';
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB28PR_Pozycje'; 
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB28UE_Dokument';
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB28UE_Pozycje'; 
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB70_Dokument';
	EXEC [wpb].[MergeTableFromStageHurtownia] 'RB70_Pozycje'; 
	
END