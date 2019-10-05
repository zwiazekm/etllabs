
CREATE VIEW wald.v_raport_import_tabel_powiazan
AS
SELECT     Opis, Ilosc, Data, Operator
FROM         wald.raport
WHERE     (Akcja = 'T') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))