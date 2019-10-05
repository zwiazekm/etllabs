-- =============================================
-- Autor:		    ?
-- Autor modyf      Krzysztof Nagły
-- Data utworzenia: ?
-- Data modyf       18.06.2014
-- Opis:            Procedura wyliczająca obroty bieżące (na każdy miesiąc bieżącego roku) i obroty poprzednioroczne (na każdy miesiąc poprzedniego roku) dla podmiotów. 
--                  Modyfikacja dodała obroty poprzednioroczne
-- =============================================
CREATE  procedure [stat].dop_wylicz_wspolczynnik_f
as
begin
  --
  exec stat.DziennikWpisInfo 'start', @@PROCID
  --
  print 'Procedura dop_wylicz_wspolczynnik_f'
  --
  -- Wyliczenie wspolczynnika F
  --
  -- ... przywóz
  
  exec stat.DziennikWpisInfo 'start: przywoz', @@PROCID;

  insert into stat.dot_wspolczynnik_f
  select 'P' typ,
		 dwd.RokMc,
         case when round (sum (convert (numeric, wartosc_stat)) / sum (convert (numeric, wartosc_faktury)), 4) < .97 then .97
              when round (sum (convert (numeric, wartosc_stat)) / sum (convert (numeric, wartosc_faktury)), 4) > 1.05 then 1.05
              else round (sum (convert (numeric, wartosc_stat)) / sum (convert (numeric, wartosc_faktury)), 4)
          end f
    from stat.dgv_kopia_istat_dekl_wynik_dok dwd,
		 stat.dgv_kopia_istat_dekl_wynik_poz dwp
   where dwd.id_dok = dwp.id_dok
     and exists (select 1
                   from stat.dgv_kopia_intr_dane_pod as dp,
                        stat.dot_kategoria as k,
                        stat.dot_okres_sprawozd as os
                  where dp.id_pod = k.id_pod
                    and dp.id_pod = os.id_pod
                    and k.rodz_kat = 'P'
                    and k.kategoria = '3'
					and dwd.RokMc between k.WaznaOdRokMc and k.WaznaDoRokMc
                    and os.[status] in ('P', 'B')
                    and os.RokMc = dwd.RokMc
                    and os.typ = k.rodz_kat
                    and dp.nip = dwd.nip_zobowiazanego)
     and dwd.typ = 'P'
     and dwd.[Status] != 'U'
     and dwp.[Status] = 'Y'
     and (dwp.rodzaj_transakcji not in (41, 51) or dwp.rodzaj_transakcji is null)
   group by RokMc
  exec stat.DziennikWpisInfo 'stop: przywoz', @@PROCID
  --
  -- ... wywóz
  exec stat.DziennikWpisInfo 'start: wywoz', @@PROCID
  insert into dot_wspolczynnik_f
  select 'W' typ,
         RokMc,
         case when round (sum (convert (numeric, wartosc_stat)) / sum (convert (numeric, wartosc_faktury)), 4) < .97 then .97
              when round (sum (convert (numeric, wartosc_stat)) / sum (convert (numeric, wartosc_faktury)), 4) > 1.05 then 1.05
              else round (sum (convert (numeric, wartosc_stat)) / sum (convert (numeric, wartosc_faktury)), 4)
          end f
    from stat.dgv_kopia_istat_dekl_wynik_dok dwd,
		 stat.dgv_kopia_istat_dekl_wynik_poz dwp
   where dwd.id_dok = dwp.id_dok
     and exists (select 1
                   from stat.dgv_kopia_intr_dane_pod dp,
                        stat.dot_kategoria k,
                        stat.dot_okres_sprawozd os
                  where dp.id_pod = k.id_pod
                    and dp.id_pod = os.id_pod
                    and k.rodz_kat = 'W'
                    and k.kategoria = '3'
                    and dwd.RokMc between k.WaznaOdRokMc and k.WaznaDoRokMc
                    and os.[status] in ('P', 'B')
                    and os.RokMc = dwd.RokMc
                    and os.typ = k.rodz_kat
                    and dp.nip = dwd.nip_zobowiazanego)
     and dwd.typ = 'W'
     and dwd.[Status] != 'U'
     and dwp.[Status] = 'Y'
     and (dwp.rodzaj_transakcji not in (41, 51) or dwp.rodzaj_transakcji is null)
   group by RokMc
  exec stat.DziennikWpisInfo 'stop: wywoz', @@PROCID
  --
  exec stat.DziennikWpisInfo 'stop', @@PROCID
end;