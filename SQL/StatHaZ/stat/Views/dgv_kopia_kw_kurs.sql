CREATE VIEW stat.dgv_kopia_kw_kurs
AS
SELECT [generacjaId], [id_waluty], [kurs], [kurs_skup], [kurs_sprzed], [mnoznik], [nr_poz], [nr_tabeli], [rodzaj], [z_dnia]
FROM stat.dgt_kopia_kw_kurs
WHERE GeneracjaId = 201305002;