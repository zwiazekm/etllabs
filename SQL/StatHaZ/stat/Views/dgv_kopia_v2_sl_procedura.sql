CREATE VIEW stat.dgv_kopia_v2_sl_procedura
AS
SELECT [generacjaId], [Opis], [Procedura]
FROM stat.dgt_kopia_v2_sl_procedura
WHERE GeneracjaId = 201305002;