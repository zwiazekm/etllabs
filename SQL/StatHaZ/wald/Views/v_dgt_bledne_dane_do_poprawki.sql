
CREATE VIEW wald.v_dgt_bledne_dane_do_poprawki
AS
SELECT     wald.dgt_bledne_dane.*
FROM         wald.dgt_bledne_dane


where bd_nowa_wartosc is null and isnull(bd_do_usuniecia,'')<>'T'