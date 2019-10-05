CREATE VIEW wald.v_widelki_EKSPORT_INTR_MASA
AS
SELECT     --TOP 100 PERCENT 
	*
FROM         wald.widelki_EKSPORT
WHERE     (znak = 'masa_intr')