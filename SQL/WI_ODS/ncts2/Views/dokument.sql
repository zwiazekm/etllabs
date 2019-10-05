
CREATE VIEW [ncts2].dokument AS 
 SELECT ar_dokument.numer_dokumentu_zisar, ar_dokument.numer_dokumentu_so, 
    ar_dokument.system_operacyjny, ar_dokument.rodzaj_dokumentu, 
    ar_dokument.nr_typu_komunikatu, ar_dokument.wynik_analizy_ryzyka, 
    ar_dokument.uc_zglaszajacy_do_aar, ar_dokument.uc_kontroli_towarow
   FROM ncts2.ar_dokument;