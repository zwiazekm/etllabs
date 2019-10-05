CREATE VIEW wald.top_masa_ecs
AS
SELECT 
--TOP 100 PERCENT 
stat,
koment,
[id],
declcoexport_decl_id,
vog_statistical_value,
gi_net_mass,
gi_quantity_suppl_unit,
CAST(CAST(vog_statistical_value / CASE WHEN gi_net_mass = 0 THEN NULL ELSE gi_net_mass END AS FLOAT) AS NUMERIC(38, 2)) AS [wartosc za kg], 

CAST(CAST(vog_statistical_value / CASE WHEN gi_quantity_suppl_unit = 0 THEN NULL ELSE gi_quantity_suppl_unit END AS FLOAT) AS NUMERIC(38, 2)) AS wartosc_szt, 
gi_desc,
gi_cn_code
FROM
wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS

--ORDER BY gi_net_mass desc