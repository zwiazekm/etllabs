CREATE   procedure [stat].dop_przepisanie_danych
  @p_data_od date,
  @p_data_do date
as
  --
  declare @id bigint;
  exec @id = stat.DziennikWpisInfo 'start', @@PROCID;
  --
  print 'Procedura dop_przepisanie_danych'
  --
  -- Przepisanie danych z deklaracji do dot_dekl_wynik_poz_nowa_wartosc_stat
  --
  --
  insert into stat.dot_dekl_wynik_poz_nowa_wartosc_stat
    select dwp.id_dok, dwp.pozid, dwp.[Status], dwp.komentarz, dwp.opis_towaru, dwp.kraj_przezn_wysyl,
           dwp.warunki_dostawy, dwp.rodzaj_transakcji, dwp.rodzaj_transportu, dwp.kod_towarowy,
           dwp.kraj_pochodzenia, dwp.masa_netto, dwp.uzup_jm, dwp.wartosc_faktury, dwp.wartosc_stat, dwp.wsk_progowy
      from stat.dgv_kopia_istat_dekl_wynik_poz dwp,
           stat.dgv_kopia_istat_dekl_wynik_dok dwd
     where dwp.id_dok = dwd.id_dok
       and dwd.RokMc between dbo.[KonwertujDateNaRokMc](@p_data_od) and dbo.[KonwertujDateNaRokMc](@p_data_do)
  --
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  --
  exec stat.DziennikWpisInfo 'stop', @@PROCID;
  exec stat.DziennikCzas @id;