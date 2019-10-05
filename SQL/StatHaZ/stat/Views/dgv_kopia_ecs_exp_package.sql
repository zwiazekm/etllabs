CREATE VIEW stat.dgv_kopia_ecs_exp_package
AS
SELECT [generacjaId], [goods_item_id], [id], [kind], [marks], [no_of_packages], [no_of_pieces], [state_br]
FROM stat.dgt_kopia_ecs_exp_package
WHERE GeneracjaId = 201305002;