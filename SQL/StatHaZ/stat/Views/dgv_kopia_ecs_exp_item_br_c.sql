CREATE VIEW stat.dgv_kopia_ecs_exp_item_br_c
AS
SELECT [comment_f], [generacjaId], [goods_item_id], [id]
FROM stat.dgt_kopia_ecs_exp_item_br_c
WHERE GeneracjaId = 201305002;