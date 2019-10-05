CREATE VIEW stat.dgv_kopia_v2_sad_nadawca
AS
SELECT [generacjaId], [idDokNr], [idKntr], [PozId]
FROM stat.dgt_kopia_v2_sad_nadawca
WHERE GeneracjaId = 201305002;