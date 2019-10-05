CREATE VIEW stat.dgv_kopia_istat_dekl_wynik_dok
AS
SELECT [generacjaId], [id_dok], [nip_zobowiazanego], [numer], [regon_zobowiazanego], [RokMc], [Status], [typ], [wersja]
FROM stat.dgt_kopia_istat_dekl_wynik_dok
WHERE GeneracjaId = 201305002;