CREATE VIEW stat.dgv_kopia_intr_rdin
AS
SELECT [generacjaId], [id_rdin], [kod_us], [NIP], [poprawnosc], [rodz_dekl], [Rok], [RokMc], [status_us], [trans_dostawa], [trans_nabycie], [wersja_dek]
FROM stat.dgt_kopia_intr_rdin
WHERE GeneracjaId = 201305002;