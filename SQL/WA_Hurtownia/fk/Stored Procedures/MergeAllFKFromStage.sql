
-- =============================================
CREATE PROCEDURE [fk].[MergeAllFKFromStage]
AS
BEGIN
	SET NOCOUNT ON;
/* zła kolejność mergowania?? 
	EXEC [fk].[MergeTableFromStageHurtownia] 'Podmiot';
	EXEC [fk].[MergeTableFromStageHurtownia] 'EwidencjaNaleznosci';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Decyzja65';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Wplaty';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Mandaty'
	EXEC [fk].[MergeTableFromStageHurtownia] 'Uszczuplenia';;
	EXEC [fk].[MergeTableFromStageHurtownia] 'KwalifikacjePrawne';
	EXEC [fk].[MergeTableFromStageHurtownia] 'PozycjeDokumentu';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Slowniki';
	EXEC [fk].[MergeTableFromStageHurtownia] 'SprawyDluzne';
	EXEC [fk].[MergeTableFromStageHurtownia] 'PodmiotDluzny';
	EXEC [fk].[MergeTableFromStageHurtownia] 'PodmiotSolidarny';
	EXEC [fk].[MergeTableFromStageHurtownia] 'SprawozdanieMeldunkowe';
	EXEC [fk].[MergeTableFromStageHurtownia] 'ZestawienieWZPW';
	EXEC [fk].[MergeTableFromStageHurtownia] 'ZestawienieWZPD';
	EXEC [fk].[MergeTableFromStageHurtownia] 'ZestawienieWBPD';
	EXEC [fk].[MergeTableFromStageHurtownia] 'ZestawienieWBPW';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Zadluzenie';
*/

	EXEC [fk].[MergeTableFromStageHurtownia] 'EwidencjaNaleznosci';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Podmiot';
	EXEC [fk].[MergeTableFromStageHurtownia] 'PodmiotDluzny';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Slowniki';
	EXEC [fk].[MergeTableFromStageHurtownia] 'SprawozdanieMeldunkowe';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Decyzja65';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Mandaty';
	EXEC [fk].[MergeTableFromStageHurtownia] 'SprawyDluzne';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Zadluzenie';
	EXEC [fk].[MergeTableFromStageHurtownia] 'ZestawienieWBPD';
	EXEC [fk].[MergeTableFromStageHurtownia] 'ZestawienieWBPW';
	EXEC [fk].[MergeTableFromStageHurtownia] 'ZestawienieWZPD';
	EXEC [fk].[MergeTableFromStageHurtownia] 'ZestawienieWZPW';
	EXEC [fk].[MergeTableFromStageHurtownia] 'KwalifikacjePrawne';
	EXEC [fk].[MergeTableFromStageHurtownia] 'PodmiotSolidarny';
	EXEC [fk].[MergeTableFromStageHurtownia] 'PozycjeDokumentu';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Uszczuplenia';
	EXEC [fk].[MergeTableFromStageHurtownia] 'Wplaty';

END