CREATE VIEW stat.dgv_kopia_v2_dok_info
AS
SELECT [Bilansowanie], [Data], [DataPrzedstawienia], [DataPrzyjecia], [EmailPodmiotu], [ExtractDate], [Flaga], [generacjaId], [idDok], [idDokNr], [idSkladajacy], [Miejsce], [NrCelina], [NrWlasny], [Pas], [RodzDok], [Status], [TerminBilansowania], [UC], [XMLVer]
FROM stat.dgt_kopia_v2_dok_info
WHERE GeneracjaId = 201305002;