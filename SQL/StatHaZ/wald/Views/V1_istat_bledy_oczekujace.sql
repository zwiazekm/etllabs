

--w excell podano - Oczekiwanie_na_korekte = 'T' - pozostaje w dgt_bledne_dane
CREATE VIEW wald.V1_istat_bledy_oczekujace
AS
SELECT     
bd_id_dok, 
Izba, 
bd_id_dok_pozid, 
rodzaj_bledu, 
Wartosc_bledna, 
Wartosc_poprawna, 
Pozycja_poprawna, 
Korekta_wprowadzona, 
Oczekiwanie_na_korekte, UWAGI
FROM         
wald.dgt_bledy_odp
WHERE    
(Oczekiwanie_na_korekte = N'T')