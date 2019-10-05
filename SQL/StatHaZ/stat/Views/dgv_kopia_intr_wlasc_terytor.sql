CREATE VIEW stat.dgv_kopia_intr_wlasc_terytor
AS
SELECT [generacjaId], [id_pod], [identyfikator], [nr_poz], [wazna_do_mies], [wazna_do_rok], [wazna_od_mies], [wazna_od_rok], [WaznaDoRokMc], [WaznaOdRokMc]
FROM stat.dgt_kopia_intr_wlasc_terytor
WHERE GeneracjaId = 201305002;