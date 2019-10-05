CREATE VIEW stat.dgv_kopia_ecs_exp_quantity_of_goods
AS
SELECT [generacjaId], [goods_item_id], [id], [qualifier_of_unit], [quantity], [unit]
FROM stat.dgt_kopia_ecs_exp_quantity_of_goods
WHERE GeneracjaId = 201305002;