
CREATE VIEW wald.v_raport_ropa_szczegoly
AS
SELECT     bd_koment AS Opis, bd_rodzaj, bd_tabela, bd_bledna_wartosc, bd_nowa_wartosc, bd_iddoknr, bd_iddoknr_pozid
FROM         wald.dgt_bledne_dane
WHERE     (bd_koment = 'Wartosc kg odbiega od średniej dla kodu CN')