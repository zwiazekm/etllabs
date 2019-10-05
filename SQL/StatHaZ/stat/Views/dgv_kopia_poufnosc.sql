CREATE VIEW stat.dgv_kopia_poufnosc
AS
SELECT [generacjaId], [kod_tow_p], [kraj], [kraj_poch_p], [kraj_przez_p], [kraj_wys_p], [nip], [nr_reguly], [regon], [wazna_do_mies], [wazna_do_rok], [wazna_od_mies], [wazna_od_rok], [WaznaDoRokMc], [WaznaOdRokMc]
FROM stat.dgt_kopia_poufnosc
WHERE GeneracjaId = 201305002;