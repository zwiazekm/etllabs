CREATE VIEW stat.dgv_kopia_intr_fwpdk
AS
SELECT [fw], [generacjaId], [id_pod], [koniec_obow], [nr_poz], [pkd], [poczatek_obow]
FROM stat.dgt_kopia_intr_fwpdk
WHERE GeneracjaId = 201305002;