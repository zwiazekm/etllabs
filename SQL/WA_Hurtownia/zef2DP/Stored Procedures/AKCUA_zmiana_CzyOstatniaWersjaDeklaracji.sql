



--CREATE PROCEDURE [zef2DP].[AKCUA_zmiana_CzyOstatniaWersjaDeklaracji]

--  AS
--    BEGIN

--	-- Part 1
--	-- Wypełnienie tabeli pomocniczej AKCUA_Pomoc
--	TRUNCATE TABLE [zef2DP].[AKCUA_Pomoc];

--    INSERT INTO 
--    [zef2DP].[AKCUA_Pomoc]
--    (
--		IdentyfikatorDokumentu,
--		NumerDokumentuMain,
--		NumerDokumentuRest,
--		StatusDokumentu,
--		DataZlozeniaDok
--    )
--    SELECT 
--        IdentyfikatorDokumentu,
--		(CASE 
--		--sprawdzenie czy numerDokumentu ma co najmniej 6 znakow(duzo przypadkow z '-01')
--			WHEN LEN(NumerDokumentu) < 6
--			THEN
--				'0'
--		--sprawdzenie czy 3 znak od konca to '-'
--			WHEN SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-2, 1) = '-' 
--			THEN 
--				SUBSTRING(NumerDokumentu, 1, LEN(NumerDokumentu)-3)
--		--sprawdzenie czy 2 znak od konca to '-'
--			WHEN SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-1, 1) = '-' 
--			THEN 
--				SUBSTRING(NumerDokumentu, 1, LEN(NumerDokumentu)-2)
--		--sprawdzany dokument jest wiekszy niz 6, ale nie posiada na koncu znaku '-' wiec wchodzi w calosci
--			ELSE
--				NumerDokumentu
--			END

--		),
--		(CASE 
--			WHEN LEN(NumerDokumentu) < 6
--			THEN
--				'-0'
--			WHEN SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-2, 1) = '-' 
--			THEN 
--				SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-2, LEN(NumerDokumentu))
			
--			WHEN SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-1, 1) = '-' 
--			THEN 
--				SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-1, LEN(NumerDokumentu))
--			ELSE
--				'-0'
--			END

--		),
--		StatusDokumentu,
--		DataZlozeniaDok
		
--	FROM [zef2DP].[AKCUA_Deklaracja]


--	-- Part 2
--	-- wypełnienie kolumny CzyOstatniaWersjaDeklaracji
--	 UPDATE [WA_Hurtownia].[zef2DP].[AKCUA_Deklaracja] 
--	 SET [CzyOstatniaWersjaDeklaracji] = 'false' 
--	 --WHERE NumerDokumentu IS NOT NULL
	 
--	 UPDATE [WA_Hurtownia].[zef2DP].[AKCUA_Deklaracja] 
--	 SET [CzyOstatniaWersjaDeklaracji] = 'true' 
--	 WHERE NumerDokumentu IS NULL AND StatusDokumentu <> 'Anulowany'

--	UPDATE [WA_Hurtownia].[zef2DP].[AKCUA_Deklaracja] 
--	SET [CzyOstatniaWersjaDeklaracji] = 'true' 
--	WHERE  IdentyfikatorDokumentu in(
--		SELECT pomoc.IdentyfikatorDokumentu
--		FROM [zef2DP].[AKCUA_Pomoc] pomoc
--		INNER JOIN
--			-- dla AKCU jest inne podzapytanie -- tutaj zrobiona modyfikacja
--			(SELECT MAX(IdentyfikatorDokumentu) AS pomocIdentyfikatorDokumentu 
--			FROM [zef2DP].[AKCUA_Pomoc]
--			GROUP BY NumerDokumentuMain, StatusDokumentu
--			HAVING StatusDokumentu = 'Zatwierdzony') groupedtt 
--		ON pomoc.IdentyfikatorDokumentu = groupedtt.PomocIdentyfikatorDokumentu 
--	)

	
--	-- Part 3
--	-- wypełnienie kolumny DataZlozeniaDeklaracjiPierwotnej WHERE DataZlozeniaDeklaracjiPierwotnej IS NULL
--		BEGIN
--			DECLARE @IdentyfikatorDokumentu nvarchar(100);
--			DECLARE @DataZlozeniaDok nvarchar(100);

--			DECLARE cur CURSOR FOR  
--			SELECT IdentyfikatorDokumentu FROM [WA_Hurtownia].[zef2DP].[AKCUA_Deklaracja] WHERE DataZlozeniaDeklaracjiPierwotnej IS NULL;
--			OPEN cur;
--			FETCH NEXT FROM cur INTO @IdentyfikatorDokumentu
--			WHILE @@FETCH_STATUS = 0

--			BEGIN			
--					SET @DataZlozeniaDok = 
--					(SELECT MIN([DataZlozeniaDok]) FROM [WA_Hurtownia].[zef2DP].[AKCUA_Pomoc]
--					WHERE [NumerDokumentuMain] = (
--					SELECT [NumerDokumentuMain] FROM [WA_Hurtownia].[zef2DP].[AKCUA_Pomoc] WHERE [IdentyfikatorDokumentu] = @IdentyfikatorDokumentu
--					))

--					UPDATE [WA_Hurtownia].[zef2DP].[AKCUA_Deklaracja]
--					SET DataZlozeniaDeklaracjiPierwotnej = @DataZlozeniaDok
--					WHERE IdentyfikatorDokumentu = @IdentyfikatorDokumentu

--					--PRINT '@DataZlozeniaDok '+ @DataZlozeniaDok + '@IdentyfikatorDokumentu' + @IdentyfikatorDokumentu;

--				FETCH NEXT FROM cur INTO @IdentyfikatorDokumentu;
--			END

--			CLOSE cur
--			DEALLOCATE cur
--		END


--    END