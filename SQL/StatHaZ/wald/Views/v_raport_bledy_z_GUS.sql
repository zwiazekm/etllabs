
CREATE VIEW wald.v_raport_bledy_z_GUS
AS
SELECT     Opis, Ilosc, Data, Operator
FROM         wald.raport
WHERE     (Akcja = 'G') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))