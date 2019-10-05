-- View: obsluga_wskazan_kontroli
CREATE VIEW [ncts2].obsluga_wskazan_kontroli AS 
 SELECT o.id, d.numer_dokumentu_zisar, o.zrodlo, o.nr_algorytmu, o.autor, 
    o.war1, o.war1_so, o.war24, o.war24_so, o.war5_so, 
    o.zmiana_war_uzasadnienie_so, o.obszar_ryzyka, 
    o.zmiana_metod_kontroli_uzasadnienie_so, o.tresc_dyrektywy, 
    o.informacja_dla_dyspozytora, o.decyzja_dyspozytora_so, 
    o.odstapienie_od_kontroli_uzasadnienie_so, o.adresaci_dyrektywy_so, 
    o.zalecenie_dyspozytora_so, o.dyrektywa_dla_kolejnego_uc_wprowadzenia_so, 
    o.zakres_przebieg_kontroli_so, o.wynik_kontroli_so
   FROM ncts2.ar_obsluga_wskazan_kontroli o, ncts2.ar_dokument d
  WHERE o.ar_dokument_id = d.id;