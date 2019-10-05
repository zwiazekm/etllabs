
CREATE VIEW [wald].[v_count_kopia]
AS
SELECT
'SAD' as [system],
'wal_dgt_kopia_v2_dok_info' as tabela,
COUNT(*) as "ilosc skopiowanych rekordow"
FROM
wald.wal_dgt_kopia_v2_dok_info
UNION 
SELECT
'SAD' as [system],
'wal_dgt_kopia_v2_dok_sad' as tabela,
COUNT(*) as "ilosc skopiowanych rekordow"
FROM
wald.wal_dgt_kopia_v2_dok_sad
UNION 
SELECT
'SAD' as [system],
'wal_dgt_kopia_v2_sad_dpdz_tow' as tabela,
COUNT(*) as "ilosc skopiowanych rekordow"
FROM
wald.wal_dgt_kopia_v2_sad_dpdz_tow
UNION 
SELECT
'SAD' as [system],
'wal_dgt_kopia_v2_sad_transport' as tabela,
COUNT(*) as "ilosc skopiowanych rekordow"
FROM
wald.wal_dgt_kopia_v2_sad_transport
UNION
SELECT
'INTRASTAT' as [system],
'wal_dgt_kopia_istat_dekl_wynik_dok' as tabela,
COUNT(*) as "ilosc skopiowanych rekordow"
FROM
wald.wal_dgt_kopia_istat_dekl_wynik_dok
UNION
SELECT
'INTRASTAT' as [system],
'wal_dgt_kopia_istat_dekl_wynik_poz' as tabela,
COUNT(*) as "ilosc skopiowanych rekordow"
FROM
wald.wal_dgt_kopia_istat_dekl_wynik_poz
UNION
SELECT
'ECS' as [system],
'wal_dgt_kopia_ecs_exp_declcoexport' as tabela,
COUNT(*) as "ilosc skopiowanych rekordow"
FROM
wald.wal_dgt_kopia_ecs_exp_declcoexport
UNION
SELECT
'ECS' as [system],
'wal_dgt_kopia_ecs_exp_goods_item' as tabela,
COUNT(*) as "ilosc skopiowanych rekordow"
FROM
wald.wal_dgt_kopia_ecs_exp_goods_item