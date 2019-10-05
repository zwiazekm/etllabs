CREATE PROCEDURE [wald].p_widelki_TYPOWANIE_REKORDOW AS

INSERT INTO wald.raport 
SELECT 'IT' AS Akcja, 'Widełki: typowanie rekordów - START' AS Opis, CONVERT(VARCHAR,0) AS Ilosc,GETDATE() AS Data, (suser_sname()) AS Operator

TRUNCATE TABLE [wald].[widelki_poprawione_rekordy];

-- Typowanie rekordów do poprawy i ich insert do tabeli

--ujm import intrastat
INSERT INTO [wald].[widelki_poprawione_rekordy]
SELECT	'ujm_intr', 
			'P',
			'dgt_kopia_istat_dekl_wynik_poz',
			poz.uzup_jm,
			NULL,
			NULL,
			poz.id_dok,
			NULL,
			poz.[PozId],
			poz.kod_towarowy,
			poz.kraj_pochodzenia,
			poz.wartosc_faktury,
			poz.generacjaId,
			suser_sname()
FROM     wal_dgt_kopia_istat_dekl_wynik_poz poz INNER JOIN wald.tbl_sl_taryfa_cn8 cn8 
			ON poz.kod_towarowy = cn8.kod_cn 
			INNER JOIN wal_dgt_kopia_istat_dekl_wynik_dok dok ON poz.id_dok=dok.id_dok 
WHERE    (cn8.nazwa_jm IS NOT NULL AND (poz.uzup_jm IS NULL OR poz.uzup_jm=0))		
			AND dok.typ='P' AND poz.kod_towarowy NOT IN (SELECT kod_cn FROM widelki_kody_do_pominiecia) AND poz.wartosc_faktury<>0

INSERT INTO wald.raport 
SELECT 'IT' AS Akcja, 'Widełki: typowanie rekordów - import intrastat ujm' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc,GETDATE() AS Data, (suser_sname()) AS Operator


-- masa import intrastat
INSERT INTO [wald].[widelki_poprawione_rekordy]
SELECT	'masa_intr', 
			'P',
			'dgt_kopia_istat_dekl_wynik_poz',
			poz.masa_netto,
			NULL,
			NULL,
			poz.id_dok,
			NULL,
			poz.[PozId],
			poz.kod_towarowy,
			poz.kraj_pochodzenia,
			poz.wartosc_faktury,
			poz.generacjaId,
			suser_sname()
FROM     wald.wal_dgt_kopia_istat_dekl_wynik_poz poz 
INNER JOIN wald.wal_dgt_kopia_istat_dekl_wynik_dok dok 
			ON poz.id_dok=dok.id_dok 
WHERE    (poz.masa_netto IS NULL OR poz.masa_netto=0) AND dok.typ='P' AND poz.kod_towarowy NOT IN (SELECT kod_cn FROM widelki_kody_do_pominiecia) AND poz.wartosc_faktury<>0

INSERT INTO wald.raport 
SELECT 'IT' AS Akcja, 'Widełki: typowanie rekordów - import intrastat masa' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc,GETDATE() AS Data, (suser_sname()) AS Operator


-- ujm import sad
INSERT INTO [wald].[widelki_poprawione_rekordy]
SELECT	'ujm_sad',
			'P',
			'dgt_kopia_v2_sad_dpdz_tow',
			st.[IloscUzupelniajacaJm],
			NULL,
			st.idDokNr,
			NULL,
			st.[PozId],
			NULL,
			st.KodTowarowy,
			st.[KrajPochodzenia],
			st.WartoscStatystyczna,
			st.generacjaId,
			suser_sname()

FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow st, 
	wald.wal_dgt_kopia_v2_dok_sad ds, 
	wald.tbl_sl_taryfa_cn8 cn8
WHERE st.idDokNr=ds.idDokNr AND st.KodTowarowy=cn8.kod_cn AND (cn8.nazwa_jm IS NOT NULL AND (st.[IloscUzupelniajacaJm] IS NULL OR 
																								    					  st.[IloscUzupelniajacaJm]=0))
AND
(LEFT (st.[Procedura], 2) in ('01','42','43','45','02','07','41','48','49','51','68','91')
or (LEFT (st.[Procedura], 2) = '40'
    AND (LEFT (st.[Procedura], 4) <> '4000' or ds.[RodzajTransakcji] <> '23'
        )               
   )
) 
AND (SUBSTRING (convert (varchar, st.[Procedura]), 3, 1) not in ('4', '5') 
     or SUBSTRING (convert (varchar, st.[Procedura]), 3, 2) = '53'
     )
AND isnull(st.KodTowarowy,'99209900') not in ('49070030', '71082000','71189000','27111100','27112100','27160000')
AND isnull(ds.[RodzajTransakcji],'') not in ('42', '43','60')
AND (right (LEFT (st.[Procedura], 4), 2) not in ('21', '22')
     or LEFT (st.[Procedura], 2) in ('61','63','68')
     )
AND st.[KrajPochodzenia] != 'PL' AND st.KodTowarowy NOT IN (SELECT kod_cn FROM widelki_kody_do_pominiecia) AND st.WartoscStatystyczna<>0

INSERT INTO wald.raport 
SELECT 'IT' AS Akcja, 'Widełki: typowanie rekordów - import sad ujm' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc,GETDATE() AS Data, (suser_sname()) AS Operator


--ujm eksport intrastat
INSERT INTO [wald].[widelki_poprawione_rekordy]
SELECT	'ujm_intr', 
			'W',
			'dgt_kopia_istat_dekl_wynik_poz',
			poz.uzup_jm,
			NULL,
			NULL,
			poz.id_dok,

			NULL,
			poz.[PozId],
			poz.kod_towarowy,
			poz.kraj_przezn_wysyl,
			poz.wartosc_faktury,
			poz.generacjaId,
			suser_sname()
FROM     wald.wal_dgt_kopia_istat_dekl_wynik_poz poz 
INNER JOIN wald.tbl_sl_taryfa_cn8 cn8 
			ON poz.kod_towarowy = cn8.kod_cn 
			INNER JOIN wald.wal_dgt_kopia_istat_dekl_wynik_dok dok ON poz.id_dok=dok.id_dok 
WHERE    (cn8.nazwa_jm IS NOT NULL AND (poz.uzup_jm IS NULL OR poz.uzup_jm=0))		
			AND dok.typ='W' AND poz.kod_towarowy NOT IN (SELECT kod_cn FROM wald.widelki_kody_do_pominiecia) AND poz.wartosc_faktury<>0

INSERT INTO wald.raport 
SELECT 'IT' AS Akcja, 'Widełki: typowanie rekordów - eksport intrastat ujm' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc,GETDATE() AS Data, (suser_sname()) AS Operator


-- masa eksport intrastat
INSERT INTO [wald].[widelki_poprawione_rekordy]
SELECT	'masa_intr', 
			'W',
			'dgt_kopia_istat_dekl_wynik_poz',
			poz.masa_netto,
			NULL,
			NULL,
			poz.id_dok,
			NULL,
			poz.[PozId],
			poz.kod_towarowy,
			poz.kraj_przezn_wysyl,
			poz.wartosc_faktury,
			poz.generacjaId,
			suser_sname()
FROM     wald.wal_dgt_kopia_istat_dekl_wynik_poz poz INNER JOIN wald.wal_dgt_kopia_istat_dekl_wynik_dok dok 
			ON poz.id_dok=dok.id_dok 
WHERE    (poz.masa_netto IS NULL OR poz.masa_netto=0) AND dok.typ='W' AND poz.kod_towarowy NOT IN (SELECT kod_cn FROM widelki_kody_do_pominiecia) AND poz.wartosc_faktury<>0

INSERT INTO wald.raport 
SELECT 'IT' AS Akcja, 'Widełki: typowanie rekordów - eksport intrastat masa' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc,GETDATE() AS Data, (suser_sname()) AS Operator


-- ujm eksport sad
INSERT INTO [wald].[widelki_poprawione_rekordy]
SELECT	'ujm_sad',
			'W',
			'dgt_kopia_v2_sad_dpdz_tow',
			st.[IloscUzupelniajacaJm],
			NULL,
			st.idDokNr,
			NULL,
			st.[PozId],
			NULL,
			st.KodTowarowy,
			st.[KrajPochodzenia],
			st.WartoscStatystyczna,
			st.generacjaId,
			suser_sname()    

FROM wal_dgt_kopia_v2_sad_dpdz_tow st, wal_dgt_kopia_v2_dok_sad ds, tbl_sl_taryfa_cn8 cn8

where st.idDokNr=ds.idDokNr AND st.KodTowarowy=cn8.kod_cn AND 
		(cn8.nazwa_jm IS NOT NULL AND(st.[IloscUzupelniajacaJm] IS NULL OR st.[IloscUzupelniajacaJm]=0))AND
      ((left (st.[Procedura], 2) = '10'
        and (left (st.[Procedura], 4) <> '1000' or ds.[RodzajTransakcji] not in ('23')
            )
            and left (st.[Procedura], 4) not in ('1021', '1022', '1071', '1076', '1077')
        )
        or left (st.[Procedura], 2) in ('11', '21', '22')
        or left (st.[Procedura], 4) in  ('3151', '3191', '3192', 
                                           '7102', '7141', '7151', '7154', 
                                           '7602', '7641', '7651', '7654', 
                                           '7702', '7741', '7751', '7754', 
                                           '7802', '7841', '7851', '7854')
       )
      and isnull(st.KodTowarowy,'') not in ('49070030', '71082000', '71189000', '27111100', '27112100', '27160000')
      and isnull(ds.[RodzajTransakcji],'') not in ('52', '53', '60')  AND st.KodTowarowy NOT IN (SELECT kod_cn FROM widelki_kody_do_pominiecia) AND st.WartoscStatystyczna<>0

INSERT INTO wald.raport 
SELECT 'IT' AS Akcja, 'Widełki: typowanie rekordów - eksport sad ujm' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc,GETDATE() AS Data, (suser_sname()) AS Operator

-- ujm ECS
INSERT INTO [wald].[widelki_poprawione_rekordy]
SELECT	'ujm_sad',
			'W',
			'dgt_kopia_v2_sad_dpdz_tow',
			gi.gi_quantity_suppl_unit,
			NULL,
			gi.declcoexport_decl_id,
			NULL,
			gi.[id],
			NULL,
			gi.gi_cn_code,
			de.exp_country_of_destinatnion,
			gi.vog_statistical_value,
			gi.generacjaId,
			suser_sname()    

FROM wald.wal_dgt_kopia_ecs_exp_goods_item gi, wal_dgt_kopia_ecs_exp_declcoexport de, tbl_sl_taryfa_cn8 cn8
WHERE (gi.gi_cn_code=cn8.kod_cn) AND (cn8.nazwa_jm IS NOT NULL AND (gi.gi_quantity_suppl_unit IS NULL OR gi.gi_quantity_suppl_unit=0)) 
AND gi.declcoexport_decl_id=de.decl_id AND gi.gi_cn_code NOT IN (SELECT kod_cn FROM widelki_kody_do_pominiecia) AND gi.vog_statistical_value<>0


INSERT INTO wald.raport 
SELECT 'IT' AS Akcja, 'Widełki: typowanie rekordów - eksport ecs ujm' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc,GETDATE() AS Data, (suser_sname()) AS Operator

INSERT INTO wald.raport 
SELECT 'IT' AS Akcja, 'Widełki: typowanie rekordów - STOP' AS Opis, CONVERT(VARCHAR,0) AS Ilosc,GETDATE() AS Data, (suser_sname()) AS Operator