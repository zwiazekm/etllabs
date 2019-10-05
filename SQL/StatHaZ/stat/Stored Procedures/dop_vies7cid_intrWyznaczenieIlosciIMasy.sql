-- =============================================
-- Autor:		    Krzysztof Nagły
-- Data utworzenia: 11.06.2014
-- Opis:            Procedura szacująca masę ilość w uzupełniających jednostkach miary
-- =============================================
CREATE PROCEDURE [stat].[dop_vies7cid_intrWyznaczenieIlosciIMasy]

AS
begin
exec stat.DziennikWpisInfo 'Początek szacowania masy i ilości - rok poprzedni';
-- stat.dot_struktura_miesieczna (rok poprzedni)
exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna'; 
update stat.dot_dekl_wynik_poz_tmp
   set masa_netto = convert(numeric(11,0),
                            (case when b.avg_cena_za_kilogram > 0 
							      then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
								       (b.avg_cena_za_kilogram * 
									    isnull((case when a.typ = 'P' 
										      then k.wspolczynnik_Kcnkg_przywoz 
											  else k.wspolczynnik_Kcnkg_wywoz 
										 end),1))
								  else null 
							 end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna b,
	   stat.dot_wspolczynnik_k k 
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.masa_netto is null 
   and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc-100 = b.RokMc
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = k.kod_towarowy
   and a.RokMc = k.RokMc; --masa

exec stat.DziennikWpisInfo 'Szacowanie ilości dla stat.dot_struktura_miesieczna'; 
update stat.dot_dekl_wynik_poz_tmp
   set uzup_jm = convert(numeric(11,0),
                         (case when b.avg_cena_za_sztuke > 0 
						       then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
							        (b.avg_cena_za_sztuke * 
						             isnull((case when a.typ = 'P' 
									              then c.wspolczynnik_Kcnj_przywoz 
												  else c.wspolczynnik_Kcnj_wywoz 
											 end),1))
                               else null 
						  end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna b,
	   stat.dot_wspolczynnik_k c
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.uzup_jm is null
   and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc-100 = b.RokMc
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = c.kod_towarowy
   and a.RokMc = c.RokMc; --ilość
-------------------------------------------------------------------------------
 -- stat.dot_struktura_miesieczna_agr_rodztran (rok poprzedni)
exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna_agr_rodztran'; 
update stat.dot_dekl_wynik_poz_tmp
   set masa_netto = convert(numeric(11,0),
                            (case when b.avg_cena_za_kilogram > 0 
							      then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
								       (b.avg_cena_za_kilogram * 
									    isnull((case when a.typ = 'P' 
										      then c.wspolczynnik_Kcnkg_przywoz 
											  else c.wspolczynnik_Kcnkg_wywoz 
										 end),1))
								  else null 
							 end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna_agr_rodztran b,
	   stat.dot_wspolczynnik_k c 
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.masa_netto is null 
   and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc-100 = b.RokMc  --TODOKN: Check data
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = c.kod_towarowy
   and a.RokMc = c.RokMc; --masa

exec stat.DziennikWpisInfo 'Szacowanie ilości dla stat.dot_struktura_miesieczna_agr_rodztran'; 
update stat.dot_dekl_wynik_poz_tmp
   set uzup_jm = convert(numeric(11,0),
                         (case when b.avg_cena_za_sztuke > 0 
						       then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
							        (b.avg_cena_za_sztuke * 
						             isnull((case when a.typ = 'P' 
									              then c.wspolczynnik_Kcnj_przywoz 
												  else c.wspolczynnik_Kcnj_wywoz 
											 end),1))
                               else null 
						  end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna_agr_rodztran b,
	   stat.dot_wspolczynnik_k c
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.uzup_jm is null
   and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc-100 = b.RokMc
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = c.kod_towarowy
   and a.RokMc = c.RokMc; --ilość       
 -----------------------------------------------------------------------------------------------   
  -- stat.dot_struktura_miesieczna_agr_kraje (rok poprzedni)
exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna_agr_kraje'; 
update stat.dot_dekl_wynik_poz_tmp
   set masa_netto = convert(numeric(11,0),
                            (case when b.avg_cena_za_kilogram > 0 
							      then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
								       (b.avg_cena_za_kilogram * 
									    isnull((case when a.typ = 'P' 
										      then c.wspolczynnik_Kcnkg_przywoz 
											  else c.wspolczynnik_Kcnkg_wywoz 
										 end),1))
								  else null 
							 end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna_agr_kraje b,
	   stat.dot_wspolczynnik_k c 
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.masa_netto is null 
   --and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   --and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc-100 = b.RokMc
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = c.kod_towarowy
   and a.RokMc = c.RokMc; --masa

exec stat.DziennikWpisInfo 'Szacowanie ilości dla stat.dot_struktura_miesieczna_agr_kraje'; 
update stat.dot_dekl_wynik_poz_tmp
   set uzup_jm = convert(numeric(11,0),
                         (case when b.avg_cena_za_sztuke > 0 
						       then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
							        (b.avg_cena_za_sztuke * 
						             isnull((case when a.typ = 'P' 
									              then c.wspolczynnik_Kcnj_przywoz 
												  else c.wspolczynnik_Kcnj_wywoz 
											 end),1))
                               else null 
						  end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna_agr_kraje b,
	   stat.dot_wspolczynnik_k c
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.uzup_jm is null
   --and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   --and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc-100 = b.RokMc
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = c.kod_towarowy
   and a.RokMc = c.RokMc; --ilość    
------------------------------------------------------------------------------------------------
  -- stat.dot_struktura_miesieczna_agr_miesiac (rok poprzedni)
exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna_agr_miesiac'; 
update stat.dot_dekl_wynik_poz_tmp
   set masa_netto = convert(numeric(11,0),
                            (case when b.avg_cena_za_kilogram > 0 
							      then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
								       (b.avg_cena_za_kilogram * 
									    isnull((case when a.typ = 'P' 
										      then c.wspolczynnik_Kcnkg_przywoz 
											  else c.wspolczynnik_Kcnkg_wywoz 
										 end),1))
								  else null 
							 end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna_agr_miesiac b,
	   stat.dot_wspolczynnik_k c 
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.masa_netto is null 
   --and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   --and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc/100-1 = b.rok
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = c.kod_towarowy
   and a.RokMc = c.RokMc; --masa

exec stat.DziennikWpisInfo 'Szacowanie ilości dla stat.dot_struktura_miesieczna_agr_miesiac'; 
update stat.dot_dekl_wynik_poz_tmp
   set uzup_jm = convert(numeric(11,0),
                         (case when b.avg_cena_za_sztuke > 0 
						       then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
							        (b.avg_cena_za_sztuke * 
						             isnull((case when a.typ = 'P' 
									              then c.wspolczynnik_Kcnj_przywoz 
												  else c.wspolczynnik_Kcnj_wywoz 
											 end),1))
                               else null 
						  end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna_agr_miesiac b,
	   stat.dot_wspolczynnik_k c
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.uzup_jm is null
   --and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   --and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc/100-1 = b.rok
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = c.kod_towarowy
   and a.RokMc = c.RokMc; --ilość
 exec stat.DziennikWpisInfo 'Koniec szacowania masy i ilości - rok poprzedni';
 ----------------------------------------------------------------------------------------------------
 exec stat.DziennikWpisInfo 'Początek szacowania masy i ilości - rok bieżący';
  --stat.dot_struktura_miesieczna (rok bieżący)
 exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna';
update stat.dot_dekl_wynik_poz_tmp
   set masa_netto = convert(numeric(11,0),
	                        (case when b.avg_cena_za_kilogram > 0 
								    then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
									    b.avg_cena_za_kilogram 
									else null 
							 end))
   from stat.dot_dekl_wynik_dok a, 
	    stat.dot_struktura_miesieczna b 
  where stat.dot_dekl_wynik_poz_tmp.id = a.id
    and stat.dot_dekl_wynik_poz_tmp.masa_netto is null 
    and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
    and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
    and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
    and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
    and a.typ = b.typ
   and a.RokMc = b.RokMc

 exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna';
update stat.dot_dekl_wynik_poz_tmp
   set uzup_jm = convert(numeric(11,0),
                         (case when b.avg_cena_za_sztuke > 0 
						       then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
								    b.avg_cena_za_sztuke 
							   else null 
						  end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna b
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.uzup_jm is null
   and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc = b.RokMc;
---------------------------------------------------------------------------------------------------
  --stat.dot_struktura_miesieczna_agr_rodztran (rok bieżący)
 exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna_agr_rodztran';
update stat.dot_dekl_wynik_poz_tmp
   set masa_netto = convert(numeric(11,0),
	                        (case when b.avg_cena_za_kilogram > 0 
								    then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
									    b.avg_cena_za_kilogram 
									else null 
							 end))
   from stat.dot_dekl_wynik_dok a, 
	    stat.dot_struktura_miesieczna_agr_rodztran b 
  where stat.dot_dekl_wynik_poz_tmp.id = a.id
    and stat.dot_dekl_wynik_poz_tmp.masa_netto is null 
    and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
    and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
    --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
    and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
    and a.typ = b.typ
    and a.RokMc = b.RokMc;

 exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna_agr_rodztran';
update stat.dot_dekl_wynik_poz_tmp
   set uzup_jm = convert(numeric(11,0),
                         (case when b.avg_cena_za_sztuke > 0 
						       then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
								    b.avg_cena_za_sztuke 
							   else null 
						  end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna_agr_rodztran b
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.uzup_jm is null
   and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
    and a.RokMc = b.RokMc;
-----------------------------------------------------------------------------------------------------
  --stat.dot_struktura_miesieczna_agr_kraje (rok bieżący)
 exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna_agr_kraje';
update stat.dot_dekl_wynik_poz_tmp
   set masa_netto = convert(numeric(11,0),
	                        (case when b.avg_cena_za_kilogram > 0 
								    then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
									    b.avg_cena_za_kilogram 
									else null 
							 end))
   from stat.dot_dekl_wynik_dok a, 
	    stat.dot_struktura_miesieczna_agr_kraje b 
  where stat.dot_dekl_wynik_poz_tmp.id = a.id
    and stat.dot_dekl_wynik_poz_tmp.masa_netto is null 
    --and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
    --and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
    --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
    and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
    and a.typ = b.typ
    and a.RokMc = b.RokMc;

 exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna_agr_kraje';
update stat.dot_dekl_wynik_poz_tmp
   set uzup_jm = convert(numeric(11,0),
                         (case when b.avg_cena_za_sztuke > 0 
						       then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
								    b.avg_cena_za_sztuke 
							   else null 
						  end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna_agr_kraje b
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.uzup_jm is null
   --and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   --and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
   and a.RokMc = b.RokMc;
------------------------------------------------------------------------------------------------------
  --stat.dot_struktura_miesieczna_agr_miesiac (rok bieżący)
 exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna_agr_miesiac';
update stat.dot_dekl_wynik_poz_tmp
   set masa_netto = convert(numeric(11,0),
	                        (case when b.avg_cena_za_kilogram > 0 
								    then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
									    b.avg_cena_za_kilogram 
									else null 
							 end))
   from stat.dot_dekl_wynik_dok a, 
	    stat.dot_struktura_miesieczna_agr_miesiac b 
  where stat.dot_dekl_wynik_poz_tmp.id = a.id
    and stat.dot_dekl_wynik_poz_tmp.masa_netto is null 
    --and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
    --and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
    --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
    and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
    and a.typ = b.typ
    and a.RokMc between b.rok * 100 + 1 AND b.rok * 100 + 12;
    --and a.miesiac = b.miesiac;

 exec stat.DziennikWpisInfo 'Szacowanie masy dla stat.dot_struktura_miesieczna_agr_miesiac';
update stat.dot_dekl_wynik_poz_tmp
   set uzup_jm = convert(numeric(11,0),
                         (case when b.avg_cena_za_sztuke > 0 
						       then stat.dot_dekl_wynik_poz_tmp.wartosc_statystyczna / 
								    b.avg_cena_za_sztuke 
							   else null 
						  end))
  from stat.dot_dekl_wynik_dok a, 
	   stat.dot_struktura_miesieczna_agr_miesiac b
 where stat.dot_dekl_wynik_poz_tmp.id = a.id
   and stat.dot_dekl_wynik_poz_tmp.uzup_jm is null
   --and stat.dot_dekl_wynik_poz_tmp.kraj_przezn_wysylki = b.kraj_przezn_wysyl
   --and stat.dot_dekl_wynik_poz_tmp.kraj_pochodzenia = b.kraj_pochodzenia
   --and stat.dot_dekl_wynik_poz_tmp.rodzaj_transakcji = b.rodzaj_transakcji
   and stat.dot_dekl_wynik_poz_tmp.kod_towarowy = b.kod_towarowy
   and a.typ = b.typ
    and a.RokMc between b.rok * 100 + 1 AND b.rok * 100 + 12;
   --and a.miesiac = b.miesiac;
 exec stat.DziennikWpisInfo 'Koniec szacowania masy i ilości - rok bieżący';
end;