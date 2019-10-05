CREATE PROCEDURE [stat].dgp_tabele_operacyjne
as
  --
  declare @id bigint;
  exec @id = stat.DziennikWpisInfo 'start', @@PROCID;
  --
  --
  -- Stworzenie/wyczyszczenie tabel na dane operacyjne
  --
  -- import
  truncate table [stat].dgt_import_sad
  --
  truncate table [stat].dgt_import_sads
  --
  truncate table [stat].dgt_import_sad_sads
  --
  truncate table [stat].dgt_import_sad_sads_agr
  --
  truncate table [stat].dgt_import_intr
  --
  truncate table [stat].dgt_import_intr_agr
  --
  truncate table [stat].dgt_import_sad_sads_intr
  --
  truncate table [stat].dgt_import_sad_sads_intr_agr
  --
  truncate table [stat].dgt_import_sad_14
  --
  truncate table [stat].dgt_import_sads_14
  --
  truncate table [stat].dgt_import_sad_sads_14
  --
  truncate table [stat].dgt_import_sad_sads_14_agr
  --
  -- eksport
  truncate table [stat].dgt_eksport_sad
  --
  truncate table [stat].dgt_eksport_sads
  --
  truncate table [stat].dgt_eksport_sad_sads
  --
  truncate table [stat].dgt_eksport_sad_sads_agr
  --
  truncate table [stat].dgt_eksport_intr
  --
  truncate table [stat].dgt_eksport_intr_agr
  --
  truncate table [stat].dgt_eksport_sad_sads_intr
  --
  --
  truncate table [stat].dgt_eksport_sad_14
  --
  truncate table [stat].dgt_eksport_sads_14
  --
  truncate table [stat].dgt_eksport_sad_sads_14
  --
  truncate table [stat].dgt_eksport_sad_sads_14_agr
  --
  -- Stworzenie tabel na dane operacyjne - tablice kontrolne
  --
  truncate table [stat].dgt_tablica_i1p
  --
  truncate table [stat].dgt_tablica_i1w
  --
  truncate table [stat].dgt_tablica_i2p
  --
  truncate table [stat].dgt_tablica_i2w
  --
  truncate table [stat].dgt_tablica_s1p
  --
  truncate table [stat].dgt_tablica_s1p_14
  --
  truncate table [stat].dgt_tablica_s1w
  --
  truncate table [stat].dgt_tablica_s1w_14
  --
  truncate table [stat].dgt_tablica_s2p
  --
  truncate table [stat].dgt_tablica_s2p_14
  --
  truncate table [stat].dgt_tablica_s2w
  --
  truncate table [stat].dgt_tablica_s2w_14
  --
  exec stat.DziennikWpisInfo 'stop', @@PROCID;
  exec stat.DziennikCzas @Id;