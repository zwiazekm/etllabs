-- View: obsluga_wskazan_kontroli_podsumowanie
CREATE VIEW [ncts2].obsluga_wskazan_kontroli_podsumowanie AS 
 SELECT p.id, p.ar_obsluga_wskazan_kontroli_id AS obsluga_wskazan_kontroli_id, 
    p.nr_pozycji, o.zakres_przebieg_kontroli_so, o.wynik_kontroli_so
   FROM ncts2.ar_obsluga_wskazan_kontroli_pozycje p, ncts2.ar_obsluga_wskazan_kontroli o
  WHERE p.ar_obsluga_wskazan_kontroli_id = o.id;