
CREATE VIEW wald.v_raport_powiazania_do_bledne_dane
AS
SELECT     Opis, Ilosc, Data
FROM         wald.raport
WHERE     (Akcja = 'Z') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112))