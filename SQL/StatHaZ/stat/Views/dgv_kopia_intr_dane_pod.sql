CREATE VIEW stat.dgv_kopia_intr_dane_pod
AS
SELECT [data_wprow], [data_zakoncz], [email], [faks], [generacjaId], [id_pod], [imie], [kod_gmina], [kod_kraj], [kod_poczt], [miejscowosc], [nazwa], [nazwisko], [nip], [nr_dom], [nr_lok], [pgus], [pintrastat], [pkep], [poczta], [pvat], [regon], [rodz_vat], [status], [telefon], [ulica], [uwagi]
FROM stat.dgt_kopia_intr_dane_pod
WHERE GeneracjaId = 201305002;