
CREATE VIEW wald.v_raport_bledne_dane_waldemar_na_statystyka
AS
SELECT     Opis, Ilosc, Data, Operator
FROM         wald.raport
WHERE     (Akcja = 'P') --AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))