CREATE VIEW stat.dgv_kopia_istat_dekl_wynik_blad
AS
SELECT [generacjaId], [id_dok], [kod], [numer], [opis], [pozid], [typ]
FROM stat.dgt_kopia_istat_dekl_wynik_blad
WHERE GeneracjaId = 201305002;