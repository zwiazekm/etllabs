CREATE VIEW stat.dgv_kopia_sl_war_dostaw
AS
SELECT [generacjaId], [kod], [opis]
FROM stat.dgt_kopia_sl_war_dostaw
WHERE GeneracjaId = 201305002;