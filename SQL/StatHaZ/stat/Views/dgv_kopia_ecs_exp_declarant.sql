CREATE VIEW stat.dgv_kopia_ecs_exp_declarant
AS
SELECT [city], [country], [date_of_entry_agent_list], [declcoexport_decl_id], [generacjaId], [id], [indication], [name_f], [no_of_entry_agents_list], [postcode], [regon], [representative_status], [street_and_no], [tin]
FROM stat.dgt_kopia_ecs_exp_declarant
WHERE GeneracjaId = 201305002;