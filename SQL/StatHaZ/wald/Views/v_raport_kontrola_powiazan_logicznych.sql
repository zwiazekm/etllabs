
CREATE VIEW wald.v_raport_kontrola_powiazan_logicznych
AS
SELECT     wartosc_star AS pow1, niedozw_wart_pow AS pow2, deklaracja_INTR AS dok_INTR, pozycja_INTR AS poz_INTR, dokument_SAD AS dok_SAD, 
                      pozycja_SAD AS poz_SAD, rodzaj_bledu AS opis
FROM         wald.tbl_sprawdzenie_powiazan_specjalne