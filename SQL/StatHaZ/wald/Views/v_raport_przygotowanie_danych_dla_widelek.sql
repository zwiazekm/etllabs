
CREATE VIEW wald.v_raport_przygotowanie_danych_dla_widelek
AS
SELECT     Opis, Ilosc, Data, Operator
FROM         wald.raport
WHERE     (Akcja = 'D') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))