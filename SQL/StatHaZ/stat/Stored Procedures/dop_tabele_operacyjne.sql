CREATE  procedure [stat].dop_tabele_operacyjne
as
  --
  declare @id bigint;
  exec @id = stat.DziennikWpisInfo 'start', @@PROCID;
  --
  -- Czyszczenie tabel na których opiera się proces doszacowania
  truncate table stat.dot_obroty_biezace;
  truncate table stat.dot_struktura_ponizej_asymilacji;
  truncate table stat.dot_wspolczynnik_f;
  truncate table stat.dot_dekl_wynik_dok;
  truncate table stat.dot_dekl_wynik_poz;
  truncate table stat.dot_dekl_wynik_poz_nowa_wartosc_stat;
  --
  exec stat.DziennikWpisInfo 'stop', @@PROCID;
  exec stat.DziennikCzas @Id;