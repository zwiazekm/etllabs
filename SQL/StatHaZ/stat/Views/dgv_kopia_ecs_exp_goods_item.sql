CREATE VIEW stat.dgv_kopia_ecs_exp_goods_item
AS
SELECT [declcoexport_decl_id], [generacjaId], [gi_cn_code], [gi_commodity_code_br], [gi_country_of_destination], [gi_country_of_export], [gi_country_of_origin], [gi_crn], [gi_desc], [gi_desc_br], [gi_gross_mass], [gi_gross_mass_br], [gi_item_no], [gi_net_mass], [gi_net_mass_br], [gi_proc_detail], [gi_proc_previous], [gi_proc_requested], [gi_quantity_suppl_unit], [gi_state_br], [gi_taric_code], [gi_taxes_amount], [gi_un_dangerous_goods], [id], [vog_statistical_currency], [vog_statistical_value]
FROM stat.dgt_kopia_ecs_exp_goods_item
WHERE GeneracjaId = 201305002;