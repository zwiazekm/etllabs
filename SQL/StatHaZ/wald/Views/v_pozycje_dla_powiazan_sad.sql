
CREATE VIEW wald.v_pozycje_dla_powiazan_sad
AS
SELECT     dt.idDokNr AS Dok, dt.[PozId] AS Poz, dt.KodTowarowy AS Kod_towarowy, dt.OpisTowaru AS Opis_towaru, dt.[KrajPochodzenia] AS Kraj_pochodzenia, 
                      ds.KrajWysylki AS Kraj_Przezn_wysyl, ds.KodDost AS Warunki_dostawy, ds.[RodzajTransakcji] AS Rodzaj_transakcji, st.Rodzaj AS Rodzaj_transportu, 
                      dt.MasaNetto AS Masa_netto, dt.[IloscUzupelniajacaJm] AS Uzup_jm, dt.WartoscStatystyczna AS Stat_PLN
FROM         wald.wal_dgt_kopia_v2_sad_dpdz_tow dt INNER JOIN
                      wald.wal_dgt_kopia_v2_dok_sad ds ON dt.idDokNr = ds.idDokNr INNER JOIN
                      wald.wal_dgt_kopia_v2_sad_transport st ON dt.idDokNr = st.idDokNr
WHERE     (st.Wewn_Granica = 'G')