CREATE VIEW stat.dgv_kopia_ecs_exp_container
AS
SELECT [generacjaId], [goods_item_id], [id], [identity_f], [state_br]
FROM stat.dgt_kopia_ecs_exp_container
WHERE GeneracjaId = 201305002;