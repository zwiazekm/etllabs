CREATE VIEW stat.dgv_kopia_ecs_exp_tax
AS
SELECT [amount], [base], [generacjaId], [goods_item_id], [id], [method_of_payment], [rate], [type]
FROM stat.dgt_kopia_ecs_exp_tax
WHERE GeneracjaId = 201305002;