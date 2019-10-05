CREATE VIEW wald.v_raport_mapowanie_tbl_przejsc
AS
SELECT   --TOP 100 PERCENT  
	Opis, Ilosc, Data
FROM         wald.raport
WHERE     (Akcja = 'M') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112)) AND (Ilosc <> '0')
--ORDER BY Data desc