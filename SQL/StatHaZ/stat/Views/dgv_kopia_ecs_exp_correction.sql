CREATE VIEW stat.dgv_kopia_ecs_exp_correction
AS
SELECT [code], [generacjaId], [goods_item_id], [id], [value]
FROM stat.dgt_kopia_ecs_exp_correction
WHERE GeneracjaId = 201305002;