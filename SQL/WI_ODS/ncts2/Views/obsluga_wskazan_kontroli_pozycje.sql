CREATE VIEW [ncts2].obsluga_wskazan_kontroli_pozycje AS 
 SELECT ar_obsluga_wskazan_kontroli_pozycje.id, 
    ar_obsluga_wskazan_kontroli_pozycje.ar_obsluga_wskazan_kontroli_id AS obsluga_wskazan_kontroli_id, 
    ar_obsluga_wskazan_kontroli_pozycje.nr_pozycji
   FROM ncts2.ar_obsluga_wskazan_kontroli_pozycje;