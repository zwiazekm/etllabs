CREATE VIEW stat.dgv_kopia_ecs_exp_exporter
AS
SELECT [city], [country], [declcoexport_decl_id], [generacjaId], [id], [name_f], [postcode], [regon], [street_and_no], [tin]
FROM stat.dgt_kopia_ecs_exp_exporter
WHERE GeneracjaId = 201305002;