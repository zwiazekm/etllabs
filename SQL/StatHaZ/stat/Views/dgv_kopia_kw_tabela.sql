CREATE VIEW stat.dgv_kopia_kw_tabela
AS
SELECT [aktywna], [data_do], [data_od], [generacjaId], [nr_tabeli], [rodzaj], [uwagi], [z_dnia]
FROM stat.dgt_kopia_kw_tabela
WHERE GeneracjaId = 201305002;