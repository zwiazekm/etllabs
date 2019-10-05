CREATE view [stat].czas_wykonania
AS
SELECT     --TOP 100 PERCENT 
		in_id, in_opis, in_czas, GETDATE() AS teraz
FROM         [stat].dgt_info