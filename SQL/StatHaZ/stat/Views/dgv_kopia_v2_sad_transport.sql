CREATE VIEW stat.dgv_kopia_v2_sad_transport
AS
SELECT [generacjaId], [idDokNr], [Kraj], [Rodzaj], [Wewn_Granica], [Znaki]
FROM stat.dgt_kopia_v2_sad_transport
WHERE GeneracjaId = 201305002;