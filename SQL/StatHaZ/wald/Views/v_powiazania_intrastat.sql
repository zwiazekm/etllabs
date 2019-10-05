
CREATE VIEW wald.v_powiazania_intrastat
AS
SELECT     wartosc_star, niedozw_wart_pow, deklaracja_INTR, pozycja_INTR, rodzaj_bledu, stat
FROM         wald.tbl_sprawdzenie_powiazan
WHERE     (dokument_SAD IS NULL)