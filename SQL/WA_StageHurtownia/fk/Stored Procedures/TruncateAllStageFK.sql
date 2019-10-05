CREATE PROCEDURE [fk].[TruncateAllStageFK]
AS
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE fk.Podmiot;
	TRUNCATE TABLE fk.Decyzja65;
	TRUNCATE TABLE fk.EwidencjaNaleznosci;
	TRUNCATE TABLE fk.Wplaty;
	TRUNCATE TABLE fk.Mandaty;
	TRUNCATE TABLE fk.PozycjeDokumentu;
	TRUNCATE TABLE fk.Uszczuplenia;
	TRUNCATE TABLE fk.KwalifikacjePrawne;
	TRUNCATE TABLE fk.Slowniki;
	TRUNCATE TABLE fk.SprawyDluzne;
	TRUNCATE TABLE fk.PodmiotDluzny;
	TRUNCATE TABLE fk.PodmiotSolidarny;
	TRUNCATE TABLE fk.SprawozdanieMeldunkowe;
	TRUNCATE TABLE fk.ZestawienieWZPW;
	TRUNCATE TABLE fk.ZestawienieWZPD;
	TRUNCATE TABLE fk.ZestawienieWBPD;
	TRUNCATE TABLE fk.ZestawienieWBPW;
	TRUNCATE TABLE fk.Zadluzenie;

END