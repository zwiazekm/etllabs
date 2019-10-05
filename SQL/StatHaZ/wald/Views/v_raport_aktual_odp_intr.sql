CREATE VIEW wald.v_raport_aktual_odp_intr
AS
SELECT  --   TOP 100 PERCENT 
	Opis, Ilosc, Data
FROM         wald.raport
WHERE     (Akcja = 'A') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))
--ORDER BY Data DESC