CREATE PROCEDURE [stat].dgp_czyszczenie_danych_zrodlowych_v2

as
  declare @v_komunikat varchar(255)
  --
    set @v_komunikat = 'START: dgp_czyszczenie_danych_zrodlowych_v2'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID

print'--rodzaj_transakcji'

  update [stat].dgv_kopia_istat_dekl_wynik_poz
     set rodzaj_transakcji = bd_nowa_wartosc
    from dgt_bledne_dane bd,
         dgv_kopia_istat_dekl_wynik_poz dwp,
         dgv_kopia_istat_dekl_wynik_dok dwd
   where dwp.id_dok = dwd.id_dok
     and bd_rodzaj = 'rodzaj_transakcji'
     and (dwp.rodzaj_transakcji = bd_bledna_wartosc or bd_bledna_wartosc is null)
     and (bd.bd_RokMc = dwd.RokMc or bd.bd_RokMc is null)
     and (bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz' or bd_tabela is null)
     and (    (bd_id_dok = dwp.id_dok and (bd_id_dok_pozid =dwp.pozid or bd_id_dok_pozid is null)))

print'--rodzajtransakcji'
  update [stat].dgv_kopia_v2_dok_sad
     set [RodzajTransakcji] = bd_nowa_wartosc
    from dgt_bledne_dane bd,
         dgv_kopia_v2_dok_sad ds,
         dgv_kopia_v2_dok_info di
   where ds.idDokNr = di.idDokNr
     and bd_rodzaj = 'rodzajtransakcji'
     and (ds.[RodzajTransakcji] = bd_bledna_wartosc or bd_bledna_wartosc is null)
     and (bd.bd_RokMc = dbo.[KonwertujDateNaRokMc](di.DataPrzyjecia) or bd.bd_RokMc is null)
     and (bd_tabela = 'dgv_kopia_v2_dok_sad' or bd_tabela is null)
     and (bd_iddoknr = ds.idDokNr )


print'--rodzaj'

  update [stat].dgv_kopia_v2_sad_transport
     set [Rodzaj] = bd_nowa_wartosc
    from dgt_bledne_dane bd,
         dgv_kopia_v2_sad_transport tr,
         dgv_kopia_v2_dok_info di
   where tr.idDokNr = di.idDokNr
     and bd_rodzaj = 'rodzaj'
     and (tr.[Rodzaj] = bd_bledna_wartosc or bd_bledna_wartosc is null)
     and (bd.bd_RokMc = dbo.[KonwertujDateNaRokMc](di.DataPrzyjecia) or bd.bd_RokMc is null)
     and (bd_tabela = 'dgv_kopia_v2_sad_transport' or bd_tabela is null)
     and (bd_iddoknr = tr.idDokNr)
print'-kraj_pochodzenia'

  update [stat].dgv_kopia_istat_dekl_wynik_poz
     set kraj_pochodzenia = bd_nowa_wartosc
    from dgt_bledne_dane bd,
         dgv_kopia_istat_dekl_wynik_poz dwp,
         dgv_kopia_istat_dekl_wynik_dok dwd
   where dwp.id_dok = dwd.id_dok
     and bd_rodzaj = 'kraj_pochodzenia'
     and (dwp.kraj_pochodzenia = bd_bledna_wartosc or bd_bledna_wartosc is null)
     and (bd.bd_RokMc = dwd.RokMc or bd.bd_RokMc is null)
     and (bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz' or bd_tabela is null)
     and (    (bd_id_dok = dwp.id_dok and (bd_id_dok_pozid =dwp.pozid or bd_id_dok_pozid is null)))


  print '-- masa_netto'
  --
  update [stat].dgv_kopia_istat_dekl_wynik_poz
     set masa_netto = bd_nowa_wartosc
    from dgt_bledne_dane bd,
         dgv_kopia_istat_dekl_wynik_poz dwp,
         dgv_kopia_istat_dekl_wynik_dok dwd
   where dwp.id_dok = dwd.id_dok
     and bd_rodzaj = 'masa_netto'
     and dwp.masa_netto = bd_bledna_wartosc
     and (bd.bd_RokMc = dwd.RokMc or bd.bd_RokMc is null)
     and (bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz')
     and (bd_id_dok = dwp.id_dok and bd_id_dok_pozid = dwp.pozid)
  --
  -- ilosc
  print '-- ilosc'
  --
  update [stat].dgv_kopia_istat_dekl_wynik_poz
     set uzup_jm = bd_nowa_wartosc
    from dgt_bledne_dane bd,
         dgv_kopia_istat_dekl_wynik_poz dwp,
         dgv_kopia_istat_dekl_wynik_dok dwd
   where dwp.id_dok = dwd.id_dok
     and bd_rodzaj = 'uzup_jm'
     and dwp.uzup_jm = bd_bledna_wartosc
     and (bd.bd_RokMc = dwd.RokMc or bd.bd_RokMc is null)
     and (bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz')
     and (bd_id_dok = dwp.id_dok and bd_id_dok_pozid = dwp.pozid)
  --
  -- wartosc_stat_zl
  print '-- wartosc_stat_zl'
  --
  update [stat].dgv_kopia_istat_dekl_wynik_poz
     set wartosc_stat = bd_nowa_wartosc
    from dgt_bledne_dane bd,
         dgv_kopia_istat_dekl_wynik_poz dwp,
         dgv_kopia_istat_dekl_wynik_dok dwd
   where dwp.id_dok = dwd.id_dok
     and bd_rodzaj = 'wartosc_stat'
     and dwp.wartosc_stat = bd_bledna_wartosc
     and (bd.bd_RokMc = dwd.RokMc or bd.bd_RokMc is null)
     and (bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz')
     and (bd_id_dok = dwp.id_dok and bd_id_dok_pozid = dwp.pozid)
  --
  -- wartosc_faktury
  print '-- wartosc_faktury'
  --
  update [stat].dgv_kopia_istat_dekl_wynik_poz
     set wartosc_faktury = bd_nowa_wartosc
    from [stat].dgt_bledne_dane bd,
         [stat].dgv_kopia_istat_dekl_wynik_poz AS dwp,
         [stat].dgv_kopia_istat_dekl_wynik_dok AS dwd
   where dwp.id_dok = dwd.id_dok
     and bd_rodzaj = 'wartosc_faktury'
     and dwp.wartosc_faktury = bd_bledna_wartosc
     and (bd.bd_RokMc = dwd.RokMc or bd.bd_RokMc is null)
     and (bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz')
     and (bd_id_dok = dwp.id_dok and bd_id_dok_pozid = dwp.pozid)

set @v_komunikat = 'STOP: dgp_czyszczenie_danych_zrodlowych_v2'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID