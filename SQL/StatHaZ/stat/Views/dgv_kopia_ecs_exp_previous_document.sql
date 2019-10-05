CREATE VIEW stat.dgv_kopia_ecs_exp_previous_document
AS
SELECT [generacjaId], [goods_item_id], [id], [ref], [type]
FROM stat.dgt_kopia_ecs_exp_previous_document
WHERE GeneracjaId = 201305002;