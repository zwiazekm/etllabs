CREATE  VIEW wald.v_widelki_EKSPORT_INTR_UJM
AS
SELECT  TOP 100 PERCENT   
	*
FROM         wald.widelki_EKSPORT 
WHERE     wald.widelki_EKSPORT.znak='ujm_intr'
--ORDER BY wald.widelki_EKSPORT.kod_towarowy