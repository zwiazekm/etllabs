CREATE  VIEW wald.v_widelki_EKSPORT_SAD_UJM
AS
SELECT  --TOP 100 PERCENT   
	*
FROM         wald.widelki_EKSPORT 
WHERE 		wald.widelki_EKSPORT.znak='ujm_sad'
--ORDER BY wald.widelki_EKSPORT.kod_towarowy