CREATE VIEW stat.dgv_kopia_ecs_exp_card3_receipient
AS
SELECT [city], [country], [declcoexport_decl_id], [generacjaId], [id], [name_f], [postcode], [street_and_no]
FROM stat.dgt_kopia_ecs_exp_card3_receipient
WHERE GeneracjaId = 201305002;