CREATE PROCEDURE [wald].p_widelki_MAPOWANIE
AS

UPDATE widelki_IMPORT
SET kod_towarowy=b.cn2013
FROM widelki_IMPORT a INNER JOIN wald.tbl_przejsc_cn_2012_2013 b
	  ON a.kod_towarowy=b.cn2012


UPDATE widelki_EKSPORT
SET kod_towarowy=b.cn2013
FROM widelki_EKSPORT a INNER JOIN wald.tbl_przejsc_cn_2012_2013 b
	  on a.kod_towarowy=b.cn2012


-- kilka kodów cn może być mapowanych na ten sam kod cn
-- należy dla dublujących się kodów wyliczyć średnia

-- import
SELECT  kod_towarowy, znak, kraj_poch, 
SUM([min])/COUNT(*) AS [min], SUM([max])/COUNT(*) AS max, SUM(srednia)/COUNT(*) AS srednia, 
SUM(rowki_wejscie) AS rowki_wejscie , SUM(rowki_odrzut) AS rowki_odrzut 
INTO #tmp
FROM wald.widelki_IMPORT
GROUP BY kod_towarowy, znak, kraj_poch
HAVING COUNT(*)>1
ORDER BY COUNT(*) DESC

DELETE FROM wald.widelki_IMPORT 
WHERE kod_towarowy+znak+kraj_poch IN (SELECT kod_towarowy+znak+kraj_poch FROM #tmp)

INSERT INTO wald.widelki_IMPORT  SELECT * FROM #tmp

DROP TABLE #tmp

-- eksport
SELECT  kod_towarowy, znak, kraj_przezn, 
SUM([min])/COUNT(*) AS [min], SUM([max])/COUNT(*) AS max, SUM(srednia)/COUNT(*) AS srednia, 
SUM(rowki_wejscie) AS rowki_wejscie , SUM(rowki_odrzut) AS rowki_odrzut 
INTO #tmp1
FROM wald.widelki_EKSPORT
GROUP BY kod_towarowy, znak, kraj_przezn
HAVING COUNT(*)>1
ORDER BY COUNT(*) DESC

DELETE FROM wald.widelki_EKSPORT
WHERE kod_towarowy+znak+kraj_przezn IN (SELECT kod_towarowy+znak+kraj_przezn FROM #tmp1)

INSERT INTO wald.widelki_EKSPORT  SELECT * FROM #tmp1

DROP TABLE #tmp1