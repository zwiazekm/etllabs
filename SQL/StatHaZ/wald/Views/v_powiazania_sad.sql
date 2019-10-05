
CREATE VIEW wald.v_powiazania_sad
AS
SELECT     wartosc_star, niedozw_wart_pow, dokument_SAD, pozycja_SAD, rodzaj_bledu, stat
FROM         wald.tbl_sprawdzenie_powiazan
WHERE     (deklaracja_INTR IS NULL)