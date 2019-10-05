CREATE VIEW stat.dgv_kopia_v2_sl_pac
AS
SELECT [generacjaId], [granica], [id_jedn], [id_jedn_nad], [nazwa], [nazwa_jedn]
FROM stat.dgt_kopia_v2_sl_pac
WHERE GeneracjaId = 201305002;