
CREATE VIEW wald.v_raport_ropa_naftowa
AS
SELECT     Opis, Ilosc, Data
FROM         wald.raport
WHERE     (Akcja = 'R') 
AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))
AND (Ilosc <>'0')