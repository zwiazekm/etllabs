CREATE VIEW stat.dgv_kopia_intr_ape
AS
SELECT [ape], [generacjaId], [id_pod], [koniec_obow], [nr_poz], [poczatek_obow], [WaznaDoRokMc], [WaznaOdRokMc]
FROM stat.dgt_kopia_intr_ape
WHERE GeneracjaId = 201305002;