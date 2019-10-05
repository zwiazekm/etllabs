CREATE VIEW wald.v_raport_kontrola_slownikowa
AS
SELECT     --TOP 100 PERCENT 
	Opis, Ilosc, Data, Operator
FROM         wald.raport
WHERE     (Akcja = 'W') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))
--ORDER BY Data DESC