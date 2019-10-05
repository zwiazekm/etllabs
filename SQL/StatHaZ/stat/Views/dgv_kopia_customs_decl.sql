CREATE VIEW stat.dgv_kopia_customs_decl
AS
SELECT [decl_type], [dts], [emergency], [flag], [generacjaId], [id], [ref_no], [return_email], [self_ref], [version]
FROM stat.dgt_kopia_customs_decl
WHERE GeneracjaId = 201305002;