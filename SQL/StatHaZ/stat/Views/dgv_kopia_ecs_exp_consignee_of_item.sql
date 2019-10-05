CREATE VIEW stat.dgv_kopia_ecs_exp_consignee_of_item
AS
SELECT [city], [country], [generacjaId], [goods_item_id], [id], [name_f], [postcode], [regon], [street_and_no], [tin]
FROM stat.dgt_kopia_ecs_exp_consignee_of_item
WHERE GeneracjaId = 201305002;