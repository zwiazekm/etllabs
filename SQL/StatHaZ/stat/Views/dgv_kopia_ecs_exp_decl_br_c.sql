CREATE VIEW stat.dgv_kopia_ecs_exp_decl_br_c
AS
SELECT [comment_f], [declcoexport_decl_id], [generacjaId], [id]
FROM stat.dgt_kopia_ecs_exp_decl_br_c
WHERE GeneracjaId = 201305002;