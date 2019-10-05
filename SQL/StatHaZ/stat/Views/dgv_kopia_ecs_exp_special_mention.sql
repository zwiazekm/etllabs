CREATE VIEW stat.dgv_kopia_ecs_exp_special_mention
AS
SELECT [code], [generacjaId], [goods_item_id], [id], [text]
FROM stat.dgt_kopia_ecs_exp_special_mention
WHERE GeneracjaId = 201305002;