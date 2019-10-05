CREATE PROCEDURE [etl].[gus005_UdzialDoszacowanPrzygotowanieTabel]
AS
	truncate table stat.udzial_doszacowan_im;
	truncate table stat.udzial_doszacowan_ek;

	---------------------------Import
	WITH t as
	(SELECT im_pcn AS CN, SUM(im_wartosc_stat_zl) AS Wartosc_stat
		FROM stat.dgt_import_intr_agr
		WHERE (im_znacznik_kategorii_progowej = '1')
		GROUP BY im_pcn),
	t1 as
	(SELECT im_pcn AS CN, SUM(im_wartosc_stat_zl) AS Wartosc_doszac
		FROM stat.dgt_import_intr_agr
		WHERE (im_znacznik_kategorii_progowej = '4')
		GROUP BY im_pcn),
	t2 as
	(SELECT im_pcn, im_odbiorca, im_nip, SUM(im_wartosc_stat_zl) AS Wartosc
		FROM stat.dgt_import_intr_agr
		WHERE im_znacznik_kategorii_progowej = '4'
		GROUP BY im_pcn, im_odbiorca, im_nip)

	insert into stat.udzial_doszacowan_im
	SELECT 
		t1.cn, 
		isnull(t.Wartosc_stat, 0) as Wartosc_rzecz,
		isnull(t1.Wartosc_doszac, 0) as Wartosc_doszac, 
		t2.im_odbiorca,
		t2.im_nip,
		isnull(t2.Wartosc, 0) AS Wartosc_doszacz_dla_podmiot,
		NULL
		--tar.opis_cn
	FROM t
		RIGHT OUTER JOIN t1 ON t.cn = t1.cn 
		INNER JOIN t2 ON t1.cn = t2.im_pcn
	;

	--------------------------Eksport
	;WITH t as
	(SELECT ek_pcn AS CN, SUM(ek_wartosc_stat_zl) AS Wartosc_stat
	FROM  stat.dgt_eksport_intr_agr
	WHERE (ek_znacznik_kategorii_progowej = '1')
	GROUP BY ek_pcn),
	t1 as 
	(SELECT ek_pcn AS CN, SUM(ek_wartosc_stat_zl) AS Wartosc_doszac
	FROM stat.dgt_eksport_intr_agr
	WHERE (ek_znacznik_kategorii_progowej ='4')
	GROUP BY ek_pcn),
	t2 as 
	(SELECT ek_pcn, ek_odbiorca, ek_nip, SUM(ek_wartosc_stat_zl) AS Wartosc
	FROM stat.dgt_eksport_intr_agr     
	WHERE ek_znacznik_kategorii_progowej = '4'
	GROUP BY  ek_pcn, ek_odbiorca, ek_nip)

	insert into stat.udzial_doszacowan_ek
	SELECT t1.cn AS Kod_CN, 
			isnull(t.Wartosc_stat, 0) as Wartosc_rzeczywista,
			isnull(t1.Wartosc_doszac, 0) as Wartosc_doszacowana, 
			t2.ek_odbiorca AS REGON, 
			t2.ek_nip, 
			isnull(t2.Wartosc, 0) AS [wartosc_doszacowan podmiotu],
			NULL
			--tar.opis_cn
	FROM t
	RIGHT OUTER JOIN t1 ON t.cn = t1.cn
	INNER JOIN t2 ON t1.cn=t2.ek_pcn
	
RETURN 0