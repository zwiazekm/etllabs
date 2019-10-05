--procedura upoufnienia kodów towarowych
--autor: jacek.przybysz ; data utworzenia: 01.10.2009

CREATE PROCEDURE [stat].dgp_upoufnienia_cn
AS
-- upoufnienie kodu 25233000
-- intrastat
UPDATE stat.dgt_kopia_istat_dekl_wynik_poz
SET kod_towarowy='25232900'
FROM stat.dgt_kopia_istat_dekl_wynik_poz poz, stat.dgt_kopia_istat_dekl_wynik_dok dok
WHERE poz.id_dok=dok.id_dok AND poz.kod_towarowy='25233000' AND dok.typ='W'

INSERT INTO [wald].raport 
SELECT 'U' AS Akcja, 'Upoufnienie kodów towarowych - INTR' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--sad
UPDATE stat.dgt_kopia_v2_sad_dpdz_tow
SET [KodTowarowy]='25232900'
FROM stat.dgt_kopia_v2_sad_dpdz_tow st, stat.dgt_kopia_v2_dok_sad ds
WHERE ds.idDokNr = st.[IdDokNr] AND st.[KodTowarowy]='25233000' AND
		(
			(left(st.[procedura], 2) = '10' AND
            (left(st.[procedura], 4) <> '1000' or ds.[RodzajTransakcji] not in ('23')) AND
          left (st.[procedura], 4) not in ('1021', '1022', '1071', '1076', '1077')
        	)
         or left (st.[procedura], 2) in ('11', '21', '22')
         or left (st.[procedura], 4) in ('3151', '3191', '3192', 
                                      '7102', '7141', '7151', '7154', 
                                      '7602', '7641', '7651', '7654', 
                                      '7702', '7741', '7751', '7754', 
                                      '7802', '7841', '7851', '7854')
		)
      AND isnull(st.[KodTowarowy],'') not in ('49070030', '71082000', '71189000', '27111100', '27112100', '27160000')
      AND isnull(ds.[RodzajTransakcji],'') not in ('52', '53', '60')

INSERT INTO [wald].raport 
SELECT 'U' AS Akcja, 'Upoufnienie kodów towarowych - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--ecs
UPDATE stat.dgt_kopia_ecs_exp_goods_item
SET gi_cn_code='25232900'  
WHERE gi_cn_code='25233000'

INSERT INTO [wald].raport 
SELECT 'U' AS Akcja, 'Upoufnienie kodów towarowych - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--kod towarowy 29051100
-- sad metanol
UPDATE stat.dgt_kopia_v2_sad_dpdz_tow
set [KodTowarowy]='29051900'
from dgt_kopia_v2_sad_dpdz_tow t, dgt_kopia_v2_dok_sad s
where  t.[IdDokNr]=s.idDokNr and t.[KrajPochodzenia]='ve' and t.[KodTowarowy]='29051100' and s.KrajWysylki='ve'

INSERT INTO [wald].raport 
SELECT 'U' AS Akcja, 'Upoufnienie kodów towarowych - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator