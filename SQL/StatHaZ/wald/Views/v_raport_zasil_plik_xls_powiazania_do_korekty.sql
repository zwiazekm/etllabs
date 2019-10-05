
CREATE VIEW wald.v_raport_zasil_plik_xls_powiazania_do_korekty
AS
SELECT     wart_start AS pow1, rodz_wart_start AS rodzaj_pow1, wart_pow_prawidl AS pow2, rodz_wart_pow_prawidl AS rodzaj_pow2, opis_pow
FROM         wald.tbl_powiazan_prawidlowych_specjalne