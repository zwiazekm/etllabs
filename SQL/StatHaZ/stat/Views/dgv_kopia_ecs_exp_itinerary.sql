CREATE VIEW stat.dgv_kopia_ecs_exp_itinerary
AS
SELECT [country], [declcoexport_decl_id], [generacjaId], [id]
FROM stat.dgt_kopia_ecs_exp_itinerary
WHERE GeneracjaId = 201305002;