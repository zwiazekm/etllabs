CREATE    VIEW wald.v_widelki_IMPORT_SAD_UJM
AS
SELECT  --TOP 100 PERCENT   
	*
FROM		wald.widelki_IMPORT
WHERE		wald.widelki_IMPORT.znak='ujm_sad'
--ORDER BY wald.widelki_IMPORT.kod_towarowy