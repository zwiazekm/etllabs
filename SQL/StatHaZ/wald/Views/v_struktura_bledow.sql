CREATE VIEW wald.v_struktura_bledow
AS
SELECT     --TOP 100 PERCENT 
bd_rodzaj AS [Rodzaj błędu], 
--bd_bledna_wartosc AS [Błędna wartość], 
bd_tabela AS [Lokalizacja błędu], 
COUNT(bd_tabela) 
                      AS Ilosc
FROM         wald.dgt_bledne_dane
GROUP BY 
bd_rodzaj, 
bd_tabela
--bd_bledna_wartosc
--ORDER BY --bd_rodzaj, 
--COUNT(bd_tabela) DESC