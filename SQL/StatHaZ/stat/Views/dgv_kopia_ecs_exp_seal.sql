CREATE VIEW stat.dgv_kopia_ecs_exp_seal
AS
SELECT [declcoexport_decl_id], [generacjaId], [id], [ident]
FROM stat.dgt_kopia_ecs_exp_seal
WHERE GeneracjaId = 201305002;