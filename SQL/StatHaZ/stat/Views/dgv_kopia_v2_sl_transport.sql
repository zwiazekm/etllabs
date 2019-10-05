CREATE VIEW stat.dgv_kopia_v2_sl_transport
AS
SELECT [generacjaId], [Opis], [Rodzaj]
FROM stat.dgt_kopia_v2_sl_transport
WHERE GeneracjaId = 201305002;