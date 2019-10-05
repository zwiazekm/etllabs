
CREATE PROCEDURE [wald].[p_raport_sprawdzenie_powiazan] AS

INSERT INTO [wald].raport
SELECT
'N' AS Akcja,
'Analiza powiązań' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator 
FROM
tbl_sprawdzenie_powiazan