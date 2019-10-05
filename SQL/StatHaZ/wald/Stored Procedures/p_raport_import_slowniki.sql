
CREATE PROCEDURE [wald].[p_raport_import_slowniki]
AS

INSERT INTO wald.raport

SELECT 
'S' AS Akcja,
'Import słowników: kraje' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator
FROM wald.tbl_sl_kraje

UNION ALL

SELECT
'S' AS Akcja,
'Import słowników: preferencje' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator
FROM wald.tbl_sl_preferencje

UNION ALL

SELECT
'S' AS Akcja,
'Import słowników: procedury' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator
FROM wald.tbl_sl_procedury4zn

UNION ALL

SELECT
'S' AS Akcja,
'Import słowników: preferencje' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator
FROM wald.tbl_sl_rodz_transakcji

UNION ALL

SELECT
'S' AS Akcja,
'Import słowników: rodzaj transportu ' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator
FROM wald.tbl_sl_rodzaje_transportu

UNION ALL

SELECT
'S' AS Akcja,
'Import słowników: kod towarowy' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator
FROM wald.tbl_sl_taryfa_cn8

UNION ALL

SELECT
'S' AS Akcja,
'Import słowników: waluty' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator
FROM wald.tbl_sl_waluty

UNION ALL

SELECT
'S' AS Akcja,
'Import słowników: warunki dostawy ' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator
FROM wald.tbl_sl_war_dostaw