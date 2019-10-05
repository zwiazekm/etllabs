
/*AND (Ilosc > 0)
*/
CREATE VIEW wald.v_raport_czyszczenie_danych_zrodlowych
AS
SELECT     Opis, Ilosc, Data
FROM         wald.raport
WHERE     (Akcja = 'C') AND (CONVERT(VARCHAR, Data, 112) = CONVERT(VARCHAR, GETDATE(), 112)) AND (Ilosc <> 0)