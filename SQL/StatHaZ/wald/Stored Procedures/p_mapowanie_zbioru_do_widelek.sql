
CREATE PROCEDURE [wald].[p_mapowanie_zbioru_do_widelek]
AS

--update zbior roczny import
--PRINT 'update zbior roczny import'

UPDATE widelki_zbior_roczny_import
SET im_pcn=bd_poprawna_wartosc
FROM
[wald].widelki_zbior_roczny_import,
[wald].tbl_przejsc_widelki
WHERE
im_pcn=bd_niepoprawna_wartosc
AND bd_kolumna='kod_towarowy'

INSERT INTO wald.raport 
SELECT 'D' AS Akcja, 'Przygotowanie danych do wyliczenia widelek: mapowanie zbioru rocznego - IMPORT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--update zbior roczny eksport
--PRINT 'update zbior roczny eksport'

UPDATE wald.widelki_zbior_roczny_eksport
SET ek_pcn=bd_poprawna_wartosc
FROM
[wald].widelki_zbior_roczny_eksport,
[wald].tbl_przejsc_widelki
WHERE
ek_pcn=bd_niepoprawna_wartosc
AND bd_kolumna='kod_towarowy'

INSERT INTO wald.raport 
SELECT 'D' AS Akcja, 'Przygotowanie danych do wyliczenia widelek: mapowanie zbioru rocznego - EKSPORT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator