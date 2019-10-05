
CREATE PROCEDURE [wald].[p_raport_przygotowanie_danych_dla_widelek] AS

INSERT INTO [wald].raport
SELECT
'D' AS Akcja,
'Przygotowanie danych do wyliczenia widelek: kopia zbioru rocznego - IMPORT' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator 
FROM
wald.widelki_zbior_roczny_import

UNION ALL

SELECT
'D' AS Akcja,
'Przygotowanie danych do wyliczenia widelek: kopia zbioru rocznego - EKSPORT' AS Opis,
COUNT(*) AS Ilosc,
GETDATE() AS Data,
(suser_sname()) AS Operator 
FROM
wald.widelki_zbior_roczny_eksport