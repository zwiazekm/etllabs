
















CREATE                      PROCEDURE 	[wald].p_widelki_EKSPORT_INTR_UJM
@zakres  DECIMAL(4,2), -- zwiększanie zakresu rozchyla widełki
@rok		VARCHAR(4) 
AS

DECLARE @kod_cn VARCHAR(8)			    
DECLARE @kraj_przezn VARCHAR(10)
DECLARE @rowki_wejscie INT
DECLARE @rowki_odrzut INT
DECLARE @start INT 
DECLARE @start_k INT 
DECLARE @sql NVARCHAR(4000)
DECLARE @slownik NVARCHAR(40)

truncate table wald.taryfa_cn8
truncate table wald.cn_kraj_poch
truncate table wald.posrednia
truncate table wald.posrednia_k

SELECT @slownik='S_'+@rok+'.wald.tbl_sl_taryfa_cn8'


SET @sql='INSERT INTO wald.taryfa_cn8 (kod_cn) SELECT ek_pcn FROM [wald].widelki_zbior_roczny_eksport,'+@slownik+'
			 WHERE ek_znacznik_kategorii_progowej!=''0'' AND ek_pcn=kod_cn AND nazwa_jm IS NOT NULL
			 GROUP BY ek_pcn ORDER BY ek_pcn'
exec sys.sp_executesql @sql


SET @sql='INSERT INTO wald.cn_kraj_poch (kod_cn, kraj_poch) SELECT ek_pcn, ek_kraj_przeznaczenia FROM [wald].widelki_zbior_roczny_eksport,'+@slownik+'
			 WHERE ek_znacznik_kategorii_progowej!=''0'' AND ek_pcn=kod_cn AND nazwa_jm IS NOT NULL
			 GROUP BY ek_pcn, ek_kraj_przeznaczenia ORDER BY ek_pcn, ek_kraj_przeznaczenia'
exec sys.sp_executesql @sql

SET @start=1

WHILE @start<=(SELECT (MAX([id])) FROM wald.taryfa_cn8)
BEGIN
	SET @kod_cn=(SELECT kod_cn FROM wald.taryfa_cn8 WHERE [id]=@start)
		insert into	posrednia
		SELECT @kod_cn AS kod_towarowy, ek_wartosc_stat_zl/ek_ilosc AS wart_cechy
		FROM	[wald].widelki_zbior_roczny_eksport
		WHERE	ek_ilosc!=0 AND
				ek_pcn = @kod_cn AND
				ek_znacznik_kategorii_progowej != '0'
	SET @rowki_wejscie=(SELECT COUNT(*) FROM wald.posrednia)

	IF @rowki_wejscie>2
	BEGIN
	DELETE FROM wald.posrednia WHERE wart_cechy<(SELECT AVG(wart_cechy)-@zakres*STDEVP(wart_cechy) FROM wald.posrednia) OR wart_cechy>(SELECT AVG(wart_cechy)+@zakres*STDEVP(wart_cechy) FROM wald.posrednia)
	SET @rowki_odrzut=(SELECT @@ROWCOUNT)
	INSERT INTO [wald].widelki_EKSPORT (kod_towarowy, znak, kraj_przezn, [min], [max], srednia, rowki_wejscie, rowki_odrzut) 
	SELECT @kod_cn, 'ujm_intr', 'ZZ', MIN(wart_cechy), MAX(wart_cechy), AVG(wart_cechy), @rowki_wejscie, @rowki_odrzut FROM wald.posrednia 
	END
	IF @rowki_wejscie IN ('1','2')
	BEGIN
	SET @rowki_odrzut=0
	INSERT INTO [wald].widelki_EKSPORT (kod_towarowy, znak, kraj_przezn, [min], [max], srednia, rowki_wejscie, rowki_odrzut) 
	SELECT @kod_cn, 'ujm_intr', 'ZZ', MIN(wart_cechy), MAX(wart_cechy), AVG(wart_cechy), @rowki_wejscie, @rowki_odrzut FROM wald.posrednia 
	END
	
	truncate table wald.posrednia
	SET @start=@start+1
END

-- z rozbiciem na kraje

SET @start_k=1
WHILE @start_k<=(SELECT MAX([id]) FROM wald.cn_kraj_poch)
BEGIN
	SET @kraj_przezn=(SELECT kraj_poch FROM wald.cn_kraj_poch WHERE [id]=@start_k)
	SET @kod_cn=(SELECT kod_cn FROM wald.cn_kraj_poch WHERE [id]=@start_k)
	
		insert into	posrednia_k
		SELECT @kod_cn AS kod_towarowy, @kraj_przezn as kraj_poch, ek_wartosc_stat_zl/ek_ilosc AS wart_cechy
		FROM	[wald].widelki_zbior_roczny_eksport
		WHERE	ek_ilosc!=0 AND
				ek_znacznik_kategorii_progowej != '0' AND
				ek_pcn=@kod_cn and ek_kraj_przeznaczenia=@kraj_przezn
	SET @rowki_wejscie=(SELECT COUNT(*) FROM wald.posrednia_k)
	
	IF @rowki_wejscie>2
	BEGIN
	DELETE FROM wald.posrednia_k WHERE wart_cechy<(SELECT AVG(wart_cechy)-@zakres*STDEVP(wart_cechy) FROM wald.posrednia_k) OR wart_cechy>(SELECT AVG(wart_cechy)+@zakres*STDEVP(wart_cechy) FROM wald.posrednia_k)
	SET @rowki_odrzut=(SELECT @@ROWCOUNT)
	INSERT INTO [wald].widelki_EKSPORT (kod_towarowy, znak, kraj_przezn, [min], [max], srednia, rowki_wejscie, rowki_odrzut) 
	SELECT @kod_cn, 'ujm_intr', @kraj_przezn, MIN(wart_cechy), MAX(wart_cechy), AVG(wart_cechy), @rowki_wejscie, @rowki_odrzut FROM wald.posrednia_k
	END
	IF @rowki_wejscie IN ('1','2')
	BEGIN
	SET @rowki_odrzut=0
	INSERT INTO [wald].widelki_EKSPORT (kod_towarowy, znak, kraj_przezn, [min], [max], srednia, rowki_wejscie, rowki_odrzut) 
	SELECT @kod_cn, 'ujm_intr', @kraj_przezn, MIN(wart_cechy), MAX(wart_cechy), AVG(wart_cechy), @rowki_wejscie, @rowki_odrzut FROM wald.posrednia_k
	END

	truncate table wald.posrednia_k
	SET @start_k=@start_k+1
END