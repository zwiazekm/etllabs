CREATE VIEW stat.dgv_kopia_v2_sad_dpdz_tow
AS
SELECT [generacjaId], [IdDokNr], [idNadawca], [idOdbiorca], [IloscUzupelniajacaJm], [KodReceptury], [KodTaric], [KodTowarowy], [KrajPochodzenia], [KrajPrzeladunku], [KrajPrzeznaczenia], [KrajWysylki], [MasaBrutto], [MasaNetto], [MetodaWartosciowania], [OpisTowaru], [P1c], [Pochodzenie], [Podklasyf_IdWzorca], [PozId], [Preferencje], [procedura], [ProceduraSzczegoly], [Przeladunek], [Samochod_Marka], [Samochod_NrNadwozia], [Samochod_NrSilnika], [Samochod_Pojemnosc], [Samochod_RodzajPaliwa], [Samochod_RokProdukcji], [TowarStrategiczny], [WartoscPozycji], [WartoscStatystyczna]
FROM stat.dgt_kopia_v2_sad_dpdz_tow
WHERE GeneracjaId = 201305002;