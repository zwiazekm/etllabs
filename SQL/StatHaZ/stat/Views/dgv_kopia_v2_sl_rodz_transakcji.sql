CREATE VIEW stat.dgv_kopia_v2_sl_rodz_transakcji
AS
SELECT [generacjaId], [Opis], [RodzajTransakcji]
FROM stat.dgt_kopia_v2_sl_rodz_transakcji
WHERE GeneracjaId = 201305002;