
/*AND Data=GETDATE()
*/
CREATE VIEW wald.v_raport_import_slowniki
AS
SELECT     Opis, Ilosc, Data, Operator
FROM         wald.raport
WHERE     (Akcja = 'S') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))