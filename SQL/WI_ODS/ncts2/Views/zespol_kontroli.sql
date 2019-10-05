  -- View: zespol_kontroli
CREATE VIEW [ncts2].zespol_kontroli AS 
 SELECT ar_zespol_kontroli.id, 
    ar_zespol_kontroli.ar_obsluga_wskazan_kontroli_id AS obsluga_wskazan_kontroli_id, 
    ar_zespol_kontroli.login, ar_zespol_kontroli.rejestrator_wynikow_zisar
   FROM ncts2.ar_zespol_kontroli;