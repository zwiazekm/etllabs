CREATE VIEW stat.dgv_kopia_ecs_exp_taric_add_code
AS
SELECT [code], [generacjaId], [goods_item_id], [id]
FROM stat.dgt_kopia_ecs_exp_taric_add_code
WHERE GeneracjaId = 201305002;