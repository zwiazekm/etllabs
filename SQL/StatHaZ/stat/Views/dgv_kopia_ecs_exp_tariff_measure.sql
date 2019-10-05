CREATE VIEW stat.dgv_kopia_ecs_exp_tariff_measure
AS
SELECT [generacjaId], [geographical_area], [goods_item_id], [id], [order_no], [series], [suppl_unit], [suppl_unit_qualifier], [taric_sid], [type]
FROM stat.dgt_kopia_ecs_exp_tariff_measure
WHERE GeneracjaId = 201305002;