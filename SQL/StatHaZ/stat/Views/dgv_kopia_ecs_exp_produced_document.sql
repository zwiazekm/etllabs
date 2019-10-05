CREATE VIEW stat.dgv_kopia_ecs_exp_produced_document
AS
SELECT [generacjaId], [goods_item_id], [id], [ref], [state_br], [state_br_c], [type]
FROM stat.dgt_kopia_ecs_exp_produced_document
WHERE GeneracjaId = 201305002;