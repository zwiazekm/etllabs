CREATE VIEW stat.dgv_kopia_v2_kontrahenci
AS
SELECT [CRP], [generacjaId], [idKntr], [KodPocztowy], [Kraj], [Miejscowosc], [Nazwa], [Pesel], [Regon], [TIN], [UlicaNumer]
FROM stat.dgt_kopia_v2_kontrahenci
WHERE GeneracjaId = 201305002;