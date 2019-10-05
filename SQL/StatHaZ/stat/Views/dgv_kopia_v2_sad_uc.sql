CREATE VIEW stat.dgv_kopia_v2_sad_uc
AS
SELECT [generacjaId], [idDokNr], [Lokalizacja_Miejsce], [Lokalizacja_Opis], [Lokalizacja_UC], [SkladCelny_Kraj], [SkladCelny_Miejsce], [SkladCelny_Typ], [UCGraniczny], [UCK_KodPocztowy], [UCK_Kraj], [UCK_Miejscowosc], [UCK_Nazwa], [UCK_UlicaNumer], [UCKontrolny], [UCPrzeznaczenia], [UCZgloszenia]
FROM stat.dgt_kopia_v2_sad_uc
WHERE GeneracjaId = 201305002;