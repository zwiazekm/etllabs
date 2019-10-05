





CREATE PROCEDURE [zef2DP].[AKCU_zmiana_CzyOstatniaWersjaDeklaracji]

  AS
    BEGIN

	;DISABLE TRIGGER [zef2DP].[AKCU_DeklaracjaTriggerData] ON [zef2DP].[AKCU_Deklaracja]

	-- Part 1
	-- Wypełnienie tabeli pomocniczej AKCU_Pomoc
	TRUNCATE TABLE [zef2DP].[AKCU_Pomoc];
	INSERT INTO 
    [zef2DP].[AKCU_Pomoc]
    (
		IdentyfikatorDokumentu,
		NumerDokumentuMain,
		NumerDokumentuRest,
		StatusDokumentu
    )
    SELECT 
        IdentyfikatorDokumentu,
		(CASE 
		--sprawdzenie czy numerDokumentu ma co najmniej 6 znakow(duzo przypadkow z '-01')
			WHEN LEN(NumerDokumentu) < 6
			THEN
				'0'
		--sprawdzenie czy 3 znak od konca to '-'
			WHEN SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-2, 1) = '-' 
			THEN 
				SUBSTRING(NumerDokumentu, 1, LEN(NumerDokumentu)-3)
		--sprawdzenie czy 2 znak od konca to '-'
			WHEN SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-1, 1) = '-' 
			THEN 
				SUBSTRING(NumerDokumentu, 1, LEN(NumerDokumentu)-2)
		--sprawdzany dokument jest wiekszy niz 6, ale nie posiada na koncu znaku '-' wiec wchodzi w calosci
			ELSE
				NumerDokumentu
			END

		),
		(CASE 
			WHEN LEN(NumerDokumentu) < 6
			THEN
				'-0'
			WHEN SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-2, 1) = '-' 
			THEN 
				SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-2, LEN(NumerDokumentu))
			
			WHEN SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-1, 1) = '-' 
			THEN 
				SUBSTRING(NumerDokumentu, LEN(NumerDokumentu)-1, LEN(NumerDokumentu))
			ELSE
				'-0'
			END

		),
		StatusDokumentu
		
	FROM [zef2DP].[AKCU_Deklaracja]


	-- Part 2
	-- wypełnienie kolumny CzyOstatniaWersjaDeklaracji
	 UPDATE [zef2DP].[AKCU_Deklaracja] 
	 SET [CzyOstatniaWersjaDeklaracji] = 'false' 
	-- WHERE NumerDokumentu IS NOT NULL

	 UPDATE [zef2DP].[AKCU_Deklaracja] 
	 SET [CzyOstatniaWersjaDeklaracji] = 'true' 
	 WHERE NumerDokumentu IS NULL AND StatusDokumentu <> 'Anulowany'

	UPDATE [zef2DP].[AKCU_Deklaracja] 
	SET [CzyOstatniaWersjaDeklaracji] = 'true' 
	WHERE  IdentyfikatorDokumentu in(
		SELECT pomoc.IdentyfikatorDokumentu
		FROM [zef2DP].[AKCU_Pomoc] pomoc
		INNER JOIN
			(SELECT NumerDokumentuMain, MAX(NumerDokumentuRest) AS pomocNumerDokumentuRest, MAX(IdentyfikatorDokumentu) AS pomocIdentyfikatorDokumentu 
			FROM [zef2DP].[AKCU_Pomoc]
			GROUP BY NumerDokumentuMain) groupedtt 
		ON pomoc.IdentyfikatorDokumentu = groupedtt.PomocIdentyfikatorDokumentu
		WHERE StatusDokumentu not like 'Anulowany%' 
	)

	;ENABLE TRIGGER [zef2DP].[AKCU_DeklaracjaTriggerData] ON [zef2DP].[AKCU_Deklaracja]


    END