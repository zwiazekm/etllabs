CREATE VIEW stat.dgv_kopia_slowniki
AS
SELECT [data], [data_do], [data_od], [generacjaId], [id_rodz_slow], [id_slown], [kwota], [kwota2], [kwota3], [kwota4], [liczba], [nazwa], [opis], [raport], [rodzaj], [symbol], [typ]
FROM stat.dgt_kopia_slowniki
WHERE GeneracjaId = 201305002;