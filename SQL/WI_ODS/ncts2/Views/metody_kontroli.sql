-- View: metody_kontroli
CREATE VIEW [ncts2].metody_kontroli AS 
 SELECT ar_metody_kontroli.id, 
    ar_metody_kontroli.ar_obsluga_wskazan_kontroli_id AS obsluga_wskazan_kontroli_id, 
    ar_metody_kontroli.poziom_zdefiniowania, ar_metody_kontroli.metoda_kontroli
   FROM ncts2.ar_metody_kontroli;