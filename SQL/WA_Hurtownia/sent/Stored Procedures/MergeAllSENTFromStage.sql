


-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2017-11-02
-- Description:	
-- =============================================

CREATE PROCEDURE [sent].[MergeAllSENTFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [sent].[MergeTableFromStageHurtownia] 'SENT_Zgloszenie';


END