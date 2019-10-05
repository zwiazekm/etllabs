CREATE VIEW wald.v_raport_kopia_danych
AS
SELECT     --TOP 100 PERCENT 
	Opis, Ilosc, Data
FROM         wald.raport
WHERE     Akcja IN ( 'K', 'T') AND CONVERT(VARCHAR,Data,112) = CONVERT(VARCHAR,GETDATE(),112)
--ORDER BY Data DESC