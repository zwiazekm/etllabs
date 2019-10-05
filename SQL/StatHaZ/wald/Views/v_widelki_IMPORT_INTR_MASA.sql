CREATE    VIEW wald.v_widelki_IMPORT_INTR_MASA
AS
SELECT  --TOP 100 PERCENT   
	*
FROM		wald.widelki_IMPORT
WHERE		wald.widelki_IMPORT.znak='masa_intr'
--ORDER BY wald.widelki_IMPORT.pk