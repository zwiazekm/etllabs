CREATE VIEW stat.dgv_kopia_ecs_exp_cancellation_request
AS
SELECT [date_of_cancellation_decision], [date_of_request], [declcoexport_decl_id], [generacjaId], [id], [justification_of_decision], [msg_id], [reason_of_request], [return_mail], [status]
FROM stat.dgt_kopia_ecs_exp_cancellation_request
WHERE GeneracjaId = 201305002;