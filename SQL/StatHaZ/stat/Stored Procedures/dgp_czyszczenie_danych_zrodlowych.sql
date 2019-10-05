CREATE PROCEDURE [stat].dgp_czyszczenie_danych_zrodlowych
AS
  -----------------------------------------------------------------------------------------------------------------------------------------
  declare @v_pk       numeric
  declare @v_rowcount numeric
  declare @v_id_dok   varchar(40)
  declare @v_iddoknr  numeric
  declare @v_tabela   varchar(40)
  declare @v_rodzaj  varchar(40)
  declare @v_typ varchar(1)
  declare @v_nowa_wartosc varchar(255)
  declare @v_komunikat varchar(255)
  --
    set @v_komunikat = 'START: dgp_czyszczenie_danych_zrodlowych'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID

	declare  c_dgt_bledne_dane cursor for 
   select bd_pk, bd_rodzaj, bd_tabela, bd_id_dok, bd_iddoknr, bd_nowa_wartosc, bd_typ  
    from dgt_bledne_dane where bd_status not in ('K','P','A')
  --
  open c_dgt_bledne_dane  
  --
	FETCH NEXT FROM c_dgt_bledne_dane 
             INTO @v_pk, @v_rodzaj, @v_tabela, @v_id_dok, @v_iddoknr, @v_nowa_wartosc, @v_typ
	--
	--
	WHILE @@FETCH_STATUS = 0
    BEGIN
    --
    set @v_rowcount = 0
   set @v_komunikat = 'dgp_czyszczenie_danych_zrodlowych: ' + convert(varchar,@v_pk)
   exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
    if @v_id_dok is not null 
      begin
        -- intrastat
        print '------------------------------'
        print 'intrastat - id_dok is not null'
        print '------------------------------'
        --
        --
        --insert into [stat].dgt_info select 'analiza: kontrola poprawności i modyfikacje - intrastat', getdate ()
        --
        -- pcn, pcnp
        print 'INTR 1 -- pcn, pcnp'
        --
      
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set kod_towarowy = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'kod_towarowy'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kraj_pochodzenia
        print 'INTR 1 -- kraj_pochodzenia'
        --
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set kraj_pochodzenia = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'kraj_pochodzenia'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kraj_wysylki
        print 'INTR 1 -- kraj_wysylki'
        --
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set kraj_przezn_wysyl = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'kraj_przezn_wysyl'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- rodzaj_transakcji
        print 'INTR 1 -- rodzaj_transakcji'
        --
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set rodzaj_transakcji = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'rodzaj_transakcji'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_transportu
        print 'INTR 1 -- kod_transportu'
        --
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set rodzaj_transportu = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'rodzaj_transportu'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_warunkow_dostawy
        print 'INTR 1 -- kod_warunkow_dostawy'
        --
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set warunki_dostawy = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'warunki_dostawy'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- masa_netto
        print 'INTR 1 -- masa_netto'
        --
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set masa_netto = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'masa_netto'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- ilosc
        print 'INTR 1 -- ilosc'
        --
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set uzup_jm = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'uzup_jm'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- wartosc_stat_zl
        print 'INTR 1 -- wartosc_stat_zl'
        --
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set wartosc_stat = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'wartosc_stat'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- wartosc_faktury
        print 'INTR 1 -- wartosc_faktury'
        --
        update [stat].dgv_kopia_istat_dekl_wynik_poz
           set wartosc_faktury = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_istat_dekl_wynik_poz dwp,
               dgv_kopia_istat_dekl_wynik_dok dwd
         where dwp.id_dok = dwd.id_dok
           and bd_pk = @v_pk
           and bd_rodzaj = 'wartosc_faktury'
           and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
           and bd_id_dok = dwp.id_dok
           and bd_id_dok_pozid = dwp.pozid
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kasowania
        print 'INTR -- kasowania'
        --
        -- ... intrastat
        print '-- ... intrastat'
        delete dgv_kopia_istat_dekl_wynik_poz
          from stat.dgv_kopia_istat_dekl_wynik_poz,
               dgt_bledne_dane 
         where bd_do_usuniecia = 'T'
           and bd_pk = @v_pk
           and bd_id_dok is not null
           and id_dok = bd_id_dok
           and (pozid = bd_id_dok_pozid or bd_id_dok_pozid is null)
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
      end
    --
    if @v_iddoknr is not null and ( @v_typ is null or @v_typ = 'S')
      begin
        print '------------------------------'
        print 'sad - iddoknr is not null'
        print '------------------------------'
        --
        --
        -----------------------------------------------------------------------------------------------------------------------------------------
        -- sad
        print 'SAD 1 -- sad'
        --
        -- insert into [stat].dgt_info select 'analiza: kontrola poprawności i modyfikacje - sad', getdate ()
        --
        -- pcn, pcnp
        print 'SAD 1 -- pcn, pcnp'
        --
        update [stat].dgv_kopia_v2_sad_dpdz_tow
           set [KodTowarowy] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_dpdz_tow st,
               dgv_kopia_v2_dok_info di
         where st.[IdDokNr] = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'kodtowarowy'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.[IdDokNr]
           and bd_iddoknr_pozid = st.[PozId]
           and bd_do_usuniecia='N'
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kraj_pochodzenia
        print 'SAD 1 -- kraj_pochodzenia'
        --
        update [stat].dgv_kopia_v2_sad_dpdz_tow
           set [KrajPochodzenia] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_dpdz_tow st,
               dgv_kopia_v2_dok_info di
         where st.[IdDokNr] = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'krajpochodzenia'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.[IdDokNr]
           and bd_iddoknr_pozid = st.[PozId]
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kraj_wysylki
        print 'SAD 1 -- kraj_wysylki'
        --
        update [stat].dgv_kopia_v2_dok_sad
           SET KrajWysylki = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_dok_sad ds,
               dgv_kopia_v2_dok_info di
         where ds.idDokNr = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'krajwysylki'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = ds.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kraj_przeznaczenia'
        print 'SAD 1 -- kraj_przeznaczenia'
        --
        update [stat].dgv_kopia_v2_dok_sad
           set [KrajPrzeznaczenia] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_dok_sad ds,
               dgv_kopia_v2_dok_info di
         where ds.idDokNr = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'krajprzeznaczenia'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = ds.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- rodzaj_transakcji
        print 'SAD 1 -- rodzaj_transakcji'
        --
        update [stat].dgv_kopia_v2_dok_sad
           set [RodzajTransakcji] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_dok_sad ds,
               dgv_kopia_v2_dok_info di
         where ds.idDokNr = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'rodzajtransakcji'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = ds.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_transportu
        print 'SAD 1 -- kod_transportu'
        --
        update [stat].dgv_kopia_v2_sad_transport
           set [Rodzaj] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_transport tr,
               dgv_kopia_v2_dok_info di
         where tr.idDokNr = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'rodzaj'
           and bd_tabela = 'dgv_kopia_v2_sad_transport'
           and bd_iddoknr = tr.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_warunkow_dostawy
        print 'SAD 1 -- kod_warunkow_dostawy'
        --
        update [stat].dgv_kopia_v2_dok_sad
           set [KodDost] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_dok_sad ds,
               dgv_kopia_v2_dok_info di
         where ds.idDokNr = di.idDokNr    
           and bd_rodzaj = 'koddost'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = ds.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_izby_celnej
        print 'SAD 1 -- kod_izby_celnej'
        --
        update [stat].dgv_kopia_v2_sad_uc
           set [UCZgloszenia] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_uc su,
               dgv_kopia_v2_dok_info di
         where su.idDokNr = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'uczgloszenia'
           and bd_tabela = 'dgv_kopia_v2_sad_uc'
           and bd_iddoknr = su.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_procedury_celnej
        print 'SAD 1 -- kod_procedury_celnej'
        --
        update [stat].dgv_kopia_v2_sad_dpdz_tow
           set [procedura] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_dpdz_tow st,
               dgv_kopia_v2_dok_info di
         where st.[IdDokNr] = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'procedura'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.[IdDokNr]
           and bd_iddoknr_pozid = st.[PozId]
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_waluty
        print 'SAD 1 -- kod_waluty'
        --
        update [stat].dgv_kopia_v2_dok_sad
           set [Waluta] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_dok_sad ds,
               dgv_kopia_v2_dok_info di
         where ds.idDokNr = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'waluta'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = ds.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_kraju_srodka_transportu
        print 'SAD 1 -- kod_kraju_srodka_transportu'
        --
        update [stat].dgv_kopia_v2_sad_transport
           set [Kraj] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_transport tr,
               dgv_kopia_v2_dok_info di
         where tr.idDokNr = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'kraj'
           and bd_tabela = 'dgv_kopia_v2_sad_transport'
           and bd_iddoknr = tr.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kontener
        print 'SAD 1 -- kontener'
        --
        update [stat].dgv_kopia_v2_dok_sad
           set [Kontenery] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_dok_sad ds,
               dgv_kopia_v2_dok_info di
         where ds.idDokNr = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'kontenery'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = ds.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_preferencji
        print 'SAD 1 -- kod_preferencji'
        --
        update [stat].dgv_kopia_v2_sad_dpdz_tow
           set [Preferencje] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_dpdz_tow st,
               dgv_kopia_v2_dok_info di
         where st.[IdDokNr] = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'preferencje'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.[IdDokNr]
           and bd_iddoknr_pozid = st.[PozId]
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- masa_netto
        print 'SAD 1 -- masa_netto'
        --
        update [stat].dgv_kopia_v2_sad_dpdz_tow
           set [MasaNetto] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_dpdz_tow st,
               dgv_kopia_v2_dok_info di
         where st.[IdDokNr] = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'masanetto'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.[IdDokNr]
           and bd_iddoknr_pozid = st.[PozId]
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- masa_brutto
        print 'SAD 1 -- masa_brutto'
        --
        update [stat].dgv_kopia_v2_dok_sad
           set [MasaBrutto] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_dok_sad ds,
               dgv_kopia_v2_dok_info di
         where ds.idDokNr = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'masabrutto'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = ds.idDokNr
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- ilosc
        print 'SAD 1 -- ilosc'
        --
        update [stat].dgv_kopia_v2_sad_dpdz_tow
           set [IloscUzupelniajacaJm] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_dpdz_tow st,
               dgv_kopia_v2_dok_info di
         where st.[IdDokNr] = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'iloscuzupelniajacajm'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.[IdDokNr]
           and bd_iddoknr_pozid = st.[PozId]
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- wartosc_stat_zl
        print 'SAD 1 -- wartosc_stat_zl'
        --
        update [stat].dgv_kopia_v2_sad_dpdz_tow
           set [WartoscStatystyczna] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_dpdz_tow st,
               dgv_kopia_v2_dok_info di
         where st.[IdDokNr] = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'wartoscstatystyczna'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.[IdDokNr]
           and bd_iddoknr_pozid = st.[PozId]
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- wartosc_pozycji
        print 'SAD 1 -- wartosc_pozycji'
        --
        update [stat].dgv_kopia_v2_sad_dpdz_tow
           set [WartoscPozycji] = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_v2_sad_dpdz_tow st,
               dgv_kopia_v2_dok_info di
         where st.[IdDokNr] = di.idDokNr
           and bd_pk = @v_pk
           and bd_rodzaj = 'wartoscpozycji'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.[IdDokNr]
           and bd_iddoknr_pozid = st.[PozId]
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kasowanie
        print 'SAD 1 -- kasowania'
        -- ... sad
        print '-- ... sad'
        delete dgv_kopia_v2_sad_dpdz_tow
          from stat.dgv_kopia_v2_sad_dpdz_tow,         
               dgt_bledne_dane 
         where bd_do_usuniecia = 'T'
           and bd_pk = @v_pk
           and bd_iddoknr is not null
           and [IdDokNr] = bd_iddoknr
           and ([PozId] = bd_iddoknr_pozid or bd_iddoknr_pozid is null)
      --
      set @v_rowcount = @v_rowcount + @@ROWCOUNT
    end
    -- ECS
    if @v_iddoknr is not null and @v_typ = 'E'
      begin
        print '------------------------------'
        print 'ECS - iddoknr is not null'
        print '------------------------------'
        --
        --
        -----------------------------------------------------------------------------------------------------------------------------------------
        -- sad
        print 'ECS 1'
        --
        -- insert into [stat].dgt_info select 'analiza: kontrola poprawności i modyfikacje - sad', getdate ()
        --
        -- pcn, pcnp
        print 'ECS 1 -- pcn, pcnp'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_cn_code = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and bd_pk = @v_pk
           and bd_rodzaj = 'kodtowarowy'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
			  and bd_do_usuniecia='N'
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kraj_pochodzenia - ECS nie ma kraju pochodzenia

        -- kraj_wysylki
        print 'ECS 1 -- kraj_wysylki gdy jest w nagłówku'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set exp_country_of_export = bd_nowa_wartosc
          from dgt_bledne_dane as bd
         where bd_pk = @v_pk
           and bd_rodzaj = 'krajwysylki'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id
           and exp_country_of_export is not null
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        print 'ECS 1 -- kraj_wysylki gdy jest na pozycji'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_country_of_export = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and bd_pk = @v_pk
           and bd_rodzaj = 'krajwysylki'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
           and gi_country_of_export is not null
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kraj_przeznaczenia'
    -- kraj_wysylki
        print 'ECS 1 -- kraj_wysylki gdy jest w nagłówku'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set exp_country_of_destinatnion = bd_nowa_wartosc
          from dgt_bledne_dane as bd
         where bd_pk = @v_pk
           and bd_rodzaj = 'krajprzeznaczenia'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id
           and exp_country_of_destinatnion is not null
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        print 'ECS 1 -- kraj_przeznaczenia gdy jest na pozycji'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_country_of_destination = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and bd_pk = @v_pk
           and bd_rodzaj = 'krajprzeznaczenia'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
           and gi_country_of_destination is not null
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --

        -- rodzaj_transakcji
        print 'ECS 1 -- rodzaj_transakcji'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set td_nature_of_transation = bd_nowa_wartosc
          from dgt_bledne_dane as bd
         where  bd_pk = @v_pk
           and bd_rodzaj = 'rodzajtransakcji'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_transportu
        print 'ECS 1 -- kod_transportu'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set tab_mode = bd_nowa_wartosc
          from dgt_bledne_dane as bd
         where bd_pk = @v_pk
           and bd_rodzaj = 'rodzaj'
           and bd_tabela = 'dgv_kopia_v2_sad_transport'
           and bd_iddoknr = decl_id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_warunkow_dostawy
        print 'ECS 1 -- kod_warunkow_dostawy'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set dt_code = bd_nowa_wartosc
          from dgt_bledne_dane as bd
         where bd_pk = @v_pk
           and bd_rodzaj = 'koddost'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_izby_celnej
        print 'ECS 1 -- kod_izby_celnej'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set exp_co_of_export = bd_nowa_wartosc
          from dgt_bledne_dane as bd
         where bd_pk = @v_pk
           and bd_rodzaj = 'uczgloszenia'
           and bd_tabela = 'dgv_kopia_v2_sad_uc'
           and bd_iddoknr = decl_id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_procedury_celnej
        print 'ECS 1 -- kod_procedury_celnej'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_proc_requested = substring(bd_nowa_wartosc,1,2),
               gi_proc_previous = substring(bd_nowa_wartosc,3,2)
          from dgt_bledne_dane as bd,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and bd_pk = @v_pk
           and bd_rodzaj = 'procedura'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_waluty
        print 'ECS 1 -- kod_waluty'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set vog_statistical_currency = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and bd_pk = @v_pk
           and bd_rodzaj = 'waluta'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_kraju_srodka_transportu
        print 'ECS 1 -- kod_kraju_srodka_transportu'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set tab_country = bd_nowa_wartosc
          from dgt_bledne_dane as bd
         where bd_pk = @v_pk
           and bd_rodzaj = 'kraj'
           and bd_tabela = 'dgv_kopia_v2_sad_transport'
           and bd_iddoknr = decl_id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kontener
        print 'ECS 1 -- kontenery'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set exp_containers = bd_nowa_wartosc
          from dgt_bledne_dane as bd
         where bd_pk = @v_pk
           and bd_rodzaj = 'kontenery'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- kod_preferencji
        print 'ECS 1 -- kod_preferencji nie używane w ECSie'
        --
        -- masa_netto
        print 'ECS 1 -- masa_netto'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_net_mass = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and bd_pk = @v_pk
           and bd_rodzaj = 'masanetto'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- masa_brutto
        print 'ECS 1 -- masa_brutto'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_gross_mass = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and bd_pk = @v_pk
           and bd_rodzaj = 'masabrutto'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- ilosc
        print 'ECS 1 -- ilosc'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_quantity_suppl_unit = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and bd_pk = @v_pk
           and bd_rodzaj = 'iloscuzupelniajacajm'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- wartosc_stat_zl
        print 'ECS 1 -- wartosc_stat_zl'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set vog_statistical_value = bd_nowa_wartosc
          from dgt_bledne_dane as bd,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and bd_pk = @v_pk
           and bd_rodzaj = 'wartoscstatystyczna'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        --
        set @v_rowcount = @v_rowcount + @@ROWCOUNT
        --
        -- wartosc_pozycji
        print 'ECS 1 -- wartosc_pozycji - nie używane'
        --
        -- kasowanie
        print 'SAD 1 -- kasowania'
        -- ... sad
        print '-- ... sad'
        delete dgv_kopia_ecs_exp_goods_item
          from stat.dgv_kopia_ecs_exp_goods_item,         
               dgt_bledne_dane 
         where bd_do_usuniecia = 'T'
           and bd_pk = @v_pk
           and bd_iddoknr is not null
           and declcoexport_decl_id = bd_iddoknr
           and (id = bd_iddoknr_pozid or bd_iddoknr_pozid is null)
      --
      set @v_rowcount = @v_rowcount + @@ROWCOUNT
    end
    --
    -- Zmiany dla wszystkich dokumentów intrastatowych
    --
    if (@v_id_dok is null) and (@v_iddoknr is null)
      begin
        print '------------------------------------'
        print 'id_dok is null) and (iddoknr is null'
        print '------------------------------------'
        if @v_nowa_wartosc is not null
          begin
            print '------------------------------------'
            print 'INTR 2 @v_nowa_wartosc is not null'
            print '------------------------------------'
            --
            -- pcn, pcnp
            print 'INTR 2 -- pcn, pcnp'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set kod_towarowy = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'kod_towarowy'
               and dwp.kod_towarowy = bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
               
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_pochodzenia
            print 'INTR 2 -- kraj_pochodzenia'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set kraj_pochodzenia = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'kraj_pochodzenia'
               and dwp.kraj_pochodzenia = bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)          
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_wysylki
            print 'INTR 2 -- kraj_wysylki'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set kraj_przezn_wysyl = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'kraj_przezn_wysyl'
               and dwp.kraj_przezn_wysyl = bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- rodzaj_transakcji
            print 'INTR 2 -- rodzaj_transakcji'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set rodzaj_transakcji = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'rodzaj_transakcji'
               and dwp.rodzaj_transakcji = bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
          
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_transportu
            print 'INTR 2 -- kod_transportu'

            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set rodzaj_transportu = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'rodzaj_transportu'
               and dwp.rodzaj_transportu =  bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
          
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_warunkow_dostawy
            print 'INTR 2 -- kod_warunkow_dostawy'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set warunki_dostawy = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'warunki_dostawy'
               and dwp.warunki_dostawy = bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
          
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- masa_netto
            print 'INTR 2 -- masa_netto'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set masa_netto = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'masa_netto'
               and dwp.masa_netto = bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
          
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- ilosc
            print 'INTR 2 -- ilosc'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set uzup_jm = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'uzup_jm'
               and dwp.uzup_jm = bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
          
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_stat_zl
            print 'INTR 2 -- wartosc_stat_zl'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set wartosc_stat = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartosc_stat'
               and dwp.wartosc_stat = bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
          
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_faktury
            print 'INTR 2 -- wartosc_faktury'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set wartosc_faktury = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartosc_faktury'
               and dwp.wartosc_faktury = bd_bledna_wartosc
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
               --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            --
            -----------------------------------------------------------------------------------------------------------------------------------------
            -- sad
            print '------------------------------------'
            print 'SAD 2 @v_nowa_wartosc is not null'
            print '------------------------------------'
            print 'SAD 2 -- sad'
            --
            --insert into [stat].dgt_info select 'analiza: kontrola poprawności i modyfikacje - sad', getdate ()
            --
            -- pcn, pcnp
            print 'SAD 2 -- pcn, pcnp'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [KodTowarowy] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'kodtowarowy'
               and [KodTowarowy] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_pochodzenia
            print 'SAD 2 -- kraj_pochodzenia'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [KrajPochodzenia] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'krajpochodzenia'
               and [KrajPochodzenia] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_wysylki
            print 'SAD 2 -- kraj_wysylki'
            --
            update [stat].dgv_kopia_v2_dok_sad
               SET KrajWysylki = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'krajwysylki'
               and ds.KrajWysylki = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_przeznaczenia'
            print 'SAD 2 -- kraj_przeznaczenia'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [KrajPrzeznaczenia] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'krajprzeznaczenia'
               and ds.[KrajPrzeznaczenia] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_zakupu
            --
            -- ... nie dotyczy
            --
            -- rodzaj_transakcji
            print 'SAD 2 -- rodzaj_transakcji'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [RodzajTransakcji] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'rodzajtransakcji'
               and ds.[RodzajTransakcji] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_transportu
            print 'SAD 2 -- kod_transportu'
            --
            update [stat].dgv_kopia_v2_sad_transport
               set [Rodzaj] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_transport tr,
                   dgv_kopia_v2_dok_info di
             where tr.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'rodzaj'
               and tr.[Rodzaj] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_transport'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_warunkow_dostawy
            print 'SAD 2 -- kod_warunkow_dostawy'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [KodDost] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr    
               and bd_rodzaj = 'koddost'
               and bd_pk = @v_pk
               and ds.[KodDost] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_izby_celnej
            print 'SAD 2 -- kod_izby_celnej'
            --
            update [stat].dgv_kopia_v2_sad_uc
               set [UCZgloszenia] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_uc su,
                   dgv_kopia_v2_dok_info di
             where su.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'uczgloszenia'
               and su.[UCZgloszenia] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_uc'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_procedury_celnej
            print 'SAD 2 -- kod_procedury_celnej'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [procedura] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'procedura'
               and [procedura] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_waluty
            print 'SAD 2 -- kod_waluty'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [Waluta] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'waluta'
               and ds.[Waluta] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_kraju_srodka_transportu
            print 'SAD 2 -- kod_kraju_srodka_transportu'
            --
            update [stat].dgv_kopia_v2_sad_transport
               set [Kraj] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_transport tr,
                   dgv_kopia_v2_dok_info di
             where tr.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'kraj'
               and tr.[Kraj] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_transport'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kontener
            print 'SAD 2 -- kontener'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [Kontenery] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'kontenery'
               and ds.[Kontenery] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_preferencji
            print 'SAD 2 -- kod_preferencji'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [Preferencje] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'preferencje'
               and [Preferencje] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- masa_netto
            print 'SAD 2 -- masa_netto'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [MasaNetto] = bd_nowa_wartosc
              from stat.dgt_bledne_dane as bd,
                   stat.dgv_kopia_v2_sad_dpdz_tow st,
                   stat.dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'masanetto'
               and [MasaNetto] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- masa_brutto
            print 'SAD 2 -- masa_brutto'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [MasaBrutto] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'masabrutto'
               and ds.[MasaBrutto] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- ilosc
            print 'SAD 2 -- ilosc'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [IloscUzupelniajacaJm] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'iloscuzupelniajacajm'
               and [IloscUzupelniajacaJm] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_stat_zl
            print 'SAD 2 -- wartosc_stat_zl'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [WartoscStatystyczna] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartoscstatystyczna'
               and [WartoscStatystyczna] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_pozycji
            print 'SAD 2 -- wartosc_pozycji'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [WartoscPozycji] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartoscpozycji'
               and [WartoscPozycji] = bd_bledna_wartosc
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            print '-------------------------------------------'
            print 'ECS 2 - nowa wartość is not null'
            print '-------------------------------------------'
            --
            -- pcn, pcnp
            print 'ECS 2 -- pcn, pcnp'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_cn_code = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and bd_pk = @v_pk
               and gi_cn_code = bd_bledna_wartosc
               and bd_rodzaj = 'kodtowarowy'
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_pochodzenia - ECS nie ma kraju pochodzenia
    
            -- kraj_wysylki
            print 'ECS 2 -- kraj_wysylki gdy jest w nagłówku'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set exp_country_of_export = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and exp_country_of_export = bd_bledna_wartosc
               and bd_rodzaj = 'krajwysylki'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and exp_country_of_export is not null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
			   
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            print 'ECS 2 -- kraj_wysylki gdy jest na pozycji'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_country_of_export = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and bd_pk = @v_pk
               and gi_country_of_export = bd_bledna_wartosc
               and bd_rodzaj = 'krajwysylki'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and gi_country_of_export is not null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_przeznaczenia'
        -- kraj_wysylki
            print 'ECS 2 -- kraj_wysylki gdy jest w nagłówku'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set exp_country_of_destinatnion = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and exp_country_of_destinatnion = bd_bledna_wartosc
               and bd_rodzaj = 'krajprzeznaczenia'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and exp_country_of_destinatnion is not null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            print 'ECS 2 -- kraj_przeznzczenia gdy jest na pozycji'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_country_of_destination = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and bd_pk = @v_pk
               and gi_country_of_destination = bd_bledna_wartosc
               and bd_rodzaj = 'krajprzeznaczenia'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
               and gi_country_of_destination is not null
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- rodzaj_transakcji
            print 'ECS 2 -- rodzaj_transakcji'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set td_nature_of_transation = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and td_nature_of_transation = bd_bledna_wartosc
               and bd_rodzaj = 'rodzajtransakcji'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_transportu
            print 'ECS 2 -- kod_transportu'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set tab_mode = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and tab_mode like bd_bledna_wartosc + '%'
               and bd_rodzaj = 'rodzaj'
               and bd_tabela = 'dgv_kopia_v2_sad_transport'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_warunkow_dostawy
            print 'ECS 2 -- kod_warunkow_dostawy'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set dt_code = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and dt_code = bd_bledna_wartosc
               and bd_rodzaj = 'koddost'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_izby_celnej
            print 'ECS 2 -- kod_izby_celnej'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set exp_co_of_export = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and exp_co_of_export like bd_bledna_wartosc + '%'
               and bd_rodzaj = 'uczgloszenia'
               and bd_tabela = 'dgv_kopia_v2_sad_uc'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_procedury_celnej
            print 'ECS 2 -- kod_procedury_celnej'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_proc_requested = substring(bd_nowa_wartosc,1,2),
                   gi_proc_previous = substring(bd_nowa_wartosc,3,2)
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and gi_proc_requested = substring(bd_bledna_wartosc,1,2)
               and gi_proc_previous = substring(bd_bledna_wartosc,3,2)
               and bd_pk = @v_pk
               and bd_rodzaj = 'procedura'
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_waluty
            print 'ECS 2 -- kod_waluty'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set vog_statistical_currency = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and vog_statistical_currency = bd_bledna_wartosc
               and bd_pk = @v_pk
               and bd_rodzaj = 'waluta'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_kraju_srodka_transportu
            print 'ECS 2 -- kod_kraju_srodka_transportu'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set tab_country = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and tab_country = bd_bledna_wartosc
               and bd_rodzaj = 'kraj'
               and bd_tabela = 'dgv_kopia_v2_sad_transport'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kontener
            print 'ECS 2 -- kontenery'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set exp_containers = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and exp_containers = bd_bledna_wartosc
               and bd_rodzaj = 'kontenery'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_preferencji
            print 'ECS 2 -- kod_preferencji nie używane w ECSie'
            --
            -- masa_netto
            print 'ECS 2 -- masa_netto'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_net_mass = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and gi_net_mass = bd_bledna_wartosc
               and bd_pk = @v_pk
               and bd_rodzaj = 'masanetto'
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- masa_brutto
            print 'ECS 2 -- masa_brutto'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_gross_mass = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and gi_gross_mass = bd_bledna_wartosc
               and bd_pk = @v_pk
               and bd_rodzaj = 'masabrutto'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- ilosc
            print 'ECS 2 -- ilosc'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_quantity_suppl_unit = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and gi_quantity_suppl_unit = bd_bledna_wartosc
               and bd_pk = @v_pk

               and bd_rodzaj = 'iloscuzupelniajacajm'
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_stat_zl
            print 'ECS 2 -- wartosc_stat_zl'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set vog_statistical_value = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and vog_statistical_value = bd_bledna_wartosc
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartoscstatystyczna'
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
          end
        else
          begin
            print '-------------------------------------------'
            print 'INTR 3 - nowa wartość is null'
            print '-------------------------------------------'
            -- pcn, pcnp
            print 'INTR 3 -- pcn, pcnp'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set kod_towarowy = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'kod_towarowy'
               and dwp.kod_towarowy is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)        
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_pochodzenia
            print 'INTR 3 -- kraj_pochodzenia'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set kraj_pochodzenia = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'kraj_pochodzenia'
               and dwp.kraj_pochodzenia is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)   
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_wysylki
            print 'INTR 3 -- kraj_wysylki'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set kraj_przezn_wysyl = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'kraj_przezn_wysyl'
               and dwp.kraj_przezn_wysyl is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'

               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
          
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- rodzaj_transakcji
            print 'INTR 3 -- rodzaj_transakcji'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set rodzaj_transakcji = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'rodzaj_transakcji'
               and dwp.rodzaj_transakcji is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_transportu
            print 'INTR 3 -- kod_transportu'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set rodzaj_transportu = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'rodzaj_transportu'
               and dwp.rodzaj_transportu is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_warunkow_dostawy
            print 'INTR 3 -- kod_warunkow_dostawy'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set warunki_dostawy = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'warunki_dostawy'
               and dwp.warunki_dostawy is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- masa_netto
            print 'INTR 3 -- masa_netto'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set masa_netto = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'masa_netto'
               and dwp.masa_netto is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- ilosc
            print 'INTR 3 -- ilosc'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set uzup_jm = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd

             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'uzup_jm'
               and dwp.uzup_jm is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_stat_zl
            print 'INTR 3 -- wartosc_stat_zl'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set wartosc_stat = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartosc_stat'
               and dwp.wartosc_stat is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_faktury
            print 'INTR 3 -- wartosc_faktury'
            --
            update [stat].dgv_kopia_istat_dekl_wynik_poz
               set wartosc_faktury = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_istat_dekl_wynik_poz dwp,
                   dgv_kopia_istat_dekl_wynik_dok dwd
             where dwp.id_dok = dwd.id_dok
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartosc_faktury'
               and dwp.wartosc_faktury is null 
               and bd_bledna_wartosc is null
               and bd_tabela = 'dgv_kopia_istat_dekl_wynik_poz'
               and (bd.bd_RokMc = dbo.KonwertujOkresNaMMYY(dwd.RokMc) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            --
            -----------------------------------------------------------------------------------------------------------------------------------------
            -- sad
            --insert into [stat].dgt_info select 'analiza: kontrola poprawności i modyfikacje - sad', getdate ()
            --
            print '-------------------------------------------'
            print 'SAD 3 - nowa wartość is null'
            print '-------------------------------------------'
            --
            -- pcn, pcnp
            print 'SAD 3 -- pcn, pcnp'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [KodTowarowy] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'kodtowarowy'
               and [KodTowarowy] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_pochodzenia
            print 'SAD 3 -- kraj_pochodzenia'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [KrajPochodzenia] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'krajpochodzenia'
               and [KrajPochodzenia] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_wysylki
            print 'SAD 3 -- kraj_wysylki'
            --
            update [stat].dgv_kopia_v2_dok_sad
               SET KrajWysylki = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'krajwysylki'
               and ds.KrajWysylki is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_przeznaczenia'
            print 'SAD 3 -- kraj_przeznaczenia'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [KrajPrzeznaczenia] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'krajprzeznaczenia'
               and ds.[KrajPrzeznaczenia] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- rodzaj_transakcji
            print 'SAD 3 -- rodzaj_transakcji'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [RodzajTransakcji] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'rodzajtransakcji'
               and ds.[RodzajTransakcji] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_transportu
            print 'SAD 3 -- kod_transportu'
            --
            update [stat].dgv_kopia_v2_sad_transport
               set [Rodzaj] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_transport tr,
                   dgv_kopia_v2_dok_info di
             where tr.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'rodzaj'
               and tr.[Rodzaj] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_transport'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_warunkow_dostawy
            print 'SAD 3 -- kod_warunkow_dostawy'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [KodDost] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr    
               and bd_rodzaj = 'koddost'
               and bd_pk = @v_pk
               and ds.[KodDost] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_izby_celnej
            print 'SAD 3 -- kod_izby_celnej'
            --
            update [stat].dgv_kopia_v2_sad_uc
               set [UCZgloszenia] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_uc su,
                   dgv_kopia_v2_dok_info di
             where su.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'uczgloszenia'
               and su.[UCZgloszenia] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_uc'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_procedury_celnej
            print 'SAD 3 -- kod_procedury_celnej'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [procedura] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'procedura'
               and [procedura] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_waluty
            print 'SAD 3 -- kod_waluty'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [Waluta] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'waluta'
               and ds.[Waluta] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_kraju_srodka_transportu
            print 'SAD 3 -- kod_kraju_srodka_transportu'
            --
            update [stat].dgv_kopia_v2_sad_transport
               set [Kraj] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_transport tr,
                   dgv_kopia_v2_dok_info di
             where tr.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'kraj'
               and tr.[Kraj] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_transport'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kontener
            print 'SAD 3 -- kontener'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [Kontenery] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'kontenery'
               and ds.[Kontenery] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_preferencji
            print 'SAD 3 -- kod_preferencji'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [Preferencje] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'preferencje'
               and [Preferencje] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- masa_netto
            print 'SAD 3 -- masa_netto'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [MasaNetto] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'masanetto'
               and [MasaNetto] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- masa_brutto
            print 'SAD 3 -- masa_brutto'
            --
            update [stat].dgv_kopia_v2_dok_sad
               set [MasaBrutto] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_dok_sad ds,
                   dgv_kopia_v2_dok_info di
             where ds.idDokNr = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'masabrutto'
               and ds.[MasaBrutto] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- ilosc
            print 'SAD 3 -- ilosc'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [IloscUzupelniajacaJm] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'iloscuzupelniajacajm'
               and [IloscUzupelniajacaJm] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_stat_zl
            print 'SAD 3 -- wartosc_stat_zl'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [WartoscStatystyczna] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartoscstatystyczna'
               and [WartoscStatystyczna] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_pozycji
            print 'SAD 3 -- wartosc_pozycji'
            --
            update [stat].dgv_kopia_v2_sad_dpdz_tow
               set [WartoscPozycji] = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_v2_sad_dpdz_tow st,
                   dgv_kopia_v2_dok_info di
             where st.[IdDokNr] = di.idDokNr
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartoscpozycji'
               and [WartoscPozycji] is null 
               and bd_bledna_wartosc is null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(di.DataPrzyjecia) or bd.bd_RokMc is null)
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            print '-------------------------------------------'
            print 'ECS 3 - nowa wartość is null'
            print '-------------------------------------------'
            --
            -- pcn, pcnp
            print 'ECS 3 -- pcn, pcnp'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_cn_code = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and bd_pk = @v_pk
               and gi_cn_code is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'kodtowarowy'
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kraj_pochodzenia - ECS nie ma kraju pochodzenia
    
            -- kraj_wysylki -- nie wiadomo który uzupełniać pozycje czy nagłówek'
           /* print 'ECS 3 -- kraj_wysylki gdy jest w nagłówku'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set exp_country_of_export = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and exp_country_of_export is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'krajwysylki'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and exp_country_of_export is not null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            print 'ECS 3 -- kraj_wysylki gdy jest na pozycji'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_country_of_export = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and bd_pk = @v_pk
               and gi_country_of_export is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'krajwysylki'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and gi_country_of_export is not null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT */
            --
            -- kraj_wysylki -- nie wiadomo który uzupełniać pozycje czy nagłówek
           /*
            print 'ECS 3 -- kraj_wysylki gdy jest w nagłówku'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set exp_country_of_destinatnion = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and exp_country_of_destinatnion is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'krajprzeznaczenia'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and exp_country_of_destinatnion is not null
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            print 'ECS 3 -- kraj_przeznzczenia gdy jest na pozycji'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_country_of_destination = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and bd_pk = @v_pk
               and gi_country_of_destination is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'krajprzeznaczenia'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
               and gi_country_of_destination is not null
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT */
            --
            -- rodzaj_transakcji
            print 'ECS 3 -- rodzaj_transakcji'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set td_nature_of_transation = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and td_nature_of_transation is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'rodzajtransakcji'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_transportu
            print 'ECS 3 -- kod_transportu'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set tab_mode = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and tab_mode is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'rodzaj'
               and bd_tabela = 'dgv_kopia_v2_sad_transport'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_warunkow_dostawy
            print 'ECS 3 -- kod_warunkow_dostawy'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set dt_code = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and dt_code is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'koddost'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_izby_celnej
            print 'ECS 3 -- kod_izby_celnej'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set exp_co_of_export = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and exp_co_of_export is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'uczgloszenia'
               and bd_tabela = 'dgv_kopia_v2_sad_uc'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_procedury_celnej
            print 'ECS 3 -- kod_procedury_celnej'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_proc_requested = substring(bd_nowa_wartosc,1,2),
                   gi_proc_previous = substring(bd_nowa_wartosc,3,2)
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and gi_proc_requested is null 
               and gi_proc_previous is null 
               and bd_bledna_wartosc is null
               and bd_pk = @v_pk
               and bd_rodzaj = 'procedura'
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_waluty
            print 'ECS 3 -- kod_waluty'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set vog_statistical_currency = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and vog_statistical_currency is null 
               and bd_bledna_wartosc is null
               and bd_pk = @v_pk
               and bd_rodzaj = 'waluta'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_kraju_srodka_transportu
            print 'ECS 3 -- kod_kraju_srodka_transportu'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set tab_country = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and tab_country is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'kraj'
               and bd_tabela = 'dgv_kopia_v2_sad_transport'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kontener
            print 'ECS 3 -- kontenery'
            --
            update [stat].dgv_kopia_ecs_exp_declcoexport
               set exp_containers = bd_nowa_wartosc
              from dgt_bledne_dane as bd
             where bd_pk = @v_pk
               and exp_containers is null 
               and bd_bledna_wartosc is null
               and bd_rodzaj = 'kontenery'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- kod_preferencji
            print 'ECS 3 -- kod_preferencji nie używane w ECSie'
            --
            -- masa_netto
            print 'ECS 3 -- masa_netto'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_net_mass = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and gi_net_mass is null 
               and bd_bledna_wartosc is null
               and bd_pk = @v_pk
               and bd_rodzaj = 'masanetto'
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- masa_brutto
            print 'ECS 3 -- masa_brutto'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_gross_mass = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and gi_gross_mass is null 
               and bd_bledna_wartosc is null
               and bd_pk = @v_pk
               and bd_rodzaj = 'masabrutto'
               and bd_tabela = 'dgv_kopia_v2_dok_sad'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- ilosc
            print 'ECS 3 -- ilosc'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set gi_quantity_suppl_unit = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and gi_quantity_suppl_unit is null 
               and bd_bledna_wartosc is null
               and bd_pk = @v_pk
               and bd_rodzaj = 'iloscuzupelniajacajm'
               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
            --
            -- wartosc_stat_zl
            print 'ECS 3 -- wartosc_stat_zl'
            --
            update [stat].dgv_kopia_ecs_exp_goods_item
               set vog_statistical_value = bd_nowa_wartosc
              from dgt_bledne_dane as bd,
                   dgv_kopia_ecs_exp_goods_item st,
                   dgv_kopia_ecs_exp_declcoexport di
             where decl_id = declcoexport_decl_id
               and vog_statistical_value is null 
               and bd_bledna_wartosc is null
               and bd_pk = @v_pk
               and bd_rodzaj = 'wartoscstatystyczna'

               and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
               and (bd.bd_RokMc = dbo.KonwertujDateNaRokMc(exp_acceptance_date) or bd.bd_RokMc is null)
            --
            set @v_rowcount = @v_rowcount + @@ROWCOUNT
          end
      end
  --
  -- aktualizacja tabeli dgt_bledne_dane_wynik  
  insert into [stat].dgt_bledne_dane_wynik
    (bd_RokMc,
    bd_rodzaj,
    bd_tabela,
    bd_bledna_wartosc,
    bd_nowa_wartosc,
    bd_iddoknr,
    bd_id_dok,
    bd_iddoknr_pozid,
    bd_id_dok_pozid,
    bd_do_usuniecia,
    bd_koment,
    bd_typ,
    bd_liczba_wierszy)
  select bd_RokMc,
         bd_rodzaj,
         bd_tabela,
         bd_bledna_wartosc,
         bd_nowa_wartosc,
         bd_iddoknr,
         bd_id_dok,
         bd_iddoknr_pozid,
         bd_id_dok_pozid,
         bd_do_usuniecia,
         bd_koment,
         bd_typ,
         @v_rowcount
   from dgt_bledne_dane as bd
  where bd_pk = @v_pk
  --
  --
  FETCH NEXT FROM c_dgt_bledne_dane 
             INTO @v_pk, @v_rodzaj, @v_tabela, @v_id_dok, @v_iddoknr, @v_nowa_wartosc, @v_typ
 END
	-- Zamkniecie kursora
	close c_dgt_bledne_dane
	deallocate c_dgt_bledne_dane

  set @v_komunikat = 'STOP: dgp_czyszczenie_danych_zrodlowych'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID