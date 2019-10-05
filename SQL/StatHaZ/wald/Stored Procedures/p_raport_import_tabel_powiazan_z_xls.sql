
CREATE PROCEDURE [wald].[p_raport_import_tabel_powiazan_z_xls] AS

INSERT INTO [wald].raport
SELECT
'T' AS Akcja,
'Import tabeli powiązań nieprawidlowych' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator 
FROM
tbl_powiazan_nieprawidl

INSERT INTO [wald].raport
SELECT
'T' AS Akcja,
'Import tabeli powiązań prawidlowych' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator 
FROM
tbl_powiazan_prawidlowych