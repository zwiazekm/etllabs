CREATE VIEW stat.dgv_kopia_ecs_exp_deferred_payment
AS
SELECT [declcoexport_decl_id], [generacjaId], [id], [ref]
FROM stat.dgt_kopia_ecs_exp_deferred_payment
WHERE GeneracjaId = 201305002;