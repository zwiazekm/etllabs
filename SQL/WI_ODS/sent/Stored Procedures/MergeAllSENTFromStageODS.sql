










-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2015-09-02
-- Description:	Procedura merge'ująca w schemacie SENT.
-- =============================================

CREATE PROCEDURE [sent].[MergeAllSENTFromStageODS]
AS

BEGIN
SET NOCOUNT ON;
	EXEC [sent].[MergeTableFromStageODS] 'SENTDaneHistoria';

END