CREATE TABLE [zef2DP].[AKCU_Deklaracja] (
    [IdentyfikatorDokumentu]                BIGINT          NOT NULL,
    [LoginUzytkownikaWprowadzDok]           NVARCHAR (255)  NULL,
    [CzyZweryfikowany]                      NVARCHAR (5)    NULL,
    [NIPLubPESELPodatnika]                  NVARCHAR (500)  NULL,
    [NumerZPNW]                             NVARCHAR (255)  NULL,
    [NumerDokumentu]                        NVARCHAR (255)  NULL,
    [NumerPaczki]                           NVARCHAR (255)  NULL,
    [SystemZrodlowy]                        NVARCHAR (8)    NULL,
    [StatusDokumentu]                       NVARCHAR (4000) NULL,
    [NumerVATUE]                            NVARCHAR (4000) NULL,
    [DeklaracjaZaOkres]                     NVARCHAR (7)    NULL,
    [Zarachowanie]                          NVARCHAR (5)    NULL,
    [PowodZarachowania]                     NVARCHAR (4000) NULL,
    [UrzadCelny]                            NVARCHAR (255)  NULL,
    [DeklaracjaCzyKorekta]                  INT             NULL,
    [DataZlozeniaDok]                       DATETIME2 (7)   NULL,
    [DataWplywuDok]                         DATETIME2 (7)   NULL,
    [NumerDokumentuPierwotnego]             NVARCHAR (255)  NULL,
    [UzasadnienieKorekty]                   NVARCHAR (4000) NULL,
    [RodzajKorekty]                         NVARCHAR (32)   NULL,
    [DataDoreczeniaKorektyZUrzedu]          DATETIME2 (7)   NULL,
    [DataDoWniesieniaSprzeciwu]             DATETIME2 (7)   NULL,
    [CzySprzeciwDoKorektyZUrzedu]           NVARCHAR (5)    NULL,
    [RazemKwotaPodatku]                     DECIMAL (19, 2) NULL,
    [ZwolnieniaObnizenia]                   DECIMAL (19, 2) NULL,
    [KwotaZnakowAkcyzy]                     DECIMAL (19, 2) NULL,
    [ZwolnieniaObnizeniaDlaGrupy]           DECIMAL (19, 2) NULL,
    [KwotaZnakowAkcyzyDlaGrupy]             DECIMAL (19, 2) NULL,
    [KwotaPodatkuPoObnizeniach]             DECIMAL (19, 4) NULL,
    [DoZaplaty]                             DECIMAL (19, 2) NULL,
    [NumerZabezpieczenia]                   NVARCHAR (4000) NULL,
    [KwotaZwolnienia]                       INT             NULL,
    [ImiePelnomocnika]                      NVARCHAR (4000) NULL,
    [NazwiskoPelnomocnika]                  NVARCHAR (4000) NULL,
    [TelefonPodatnikaLubPelnomocnika]       NVARCHAR (4000) NULL,
    [EmailPodatnikaLubPelnomocnika]         NVARCHAR (4000) NULL,
    [SprawdzPelnomocnictwa]                 NVARCHAR (5)    NULL,
    [UwagiUrzeduCelnego]                    NVARCHAR (4000) NULL,
    [DataZlozeniaDeklaracjiPierwotnej]      DATETIME2 (7)   NULL,
    [CzyOstatniaWersjaDeklaracji]           NVARCHAR (5)    NULL,
    [DataArch]                              DATETIME2 (7)   NULL,
    [ID_Pismo_xml]                          BIGINT          NULL,
    [UrzadSkarbowyDoKtoregoAdresowaneNazwa] NVARCHAR (4000) NULL,
    [MigracjaReczna]                        NVARCHAR (5)    NULL,
    [FormaZlozeniaDok]                      NVARCHAR (255)  NULL,
    [DokumentArchiwalny]                    NVARCHAR (5)    NULL,
    CONSTRAINT [AKCU_Deklaracja_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DP]
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160803-121330]
    ON [zef2DP].[AKCU_Deklaracja]([NumerDokumentu] ASC)
    ON [FG_ZEF2DP];


GO




CREATE TRIGGER [zef2DP].[AKCU_DeklaracjaTriggerData]
   ON  [zef2DP].[AKCU_Deklaracja]
   AFTER INSERT,UPDATE
AS 
BEGIN

DECLARE @current_template_id2 nvarchar(100);
DECLARE @NumerDokumentuTemp nvarchar(100);

DECLARE cur2 CURSOR FOR  
SELECT NumerDokumentu From INSERTED WHERE DataZlozeniaDeklaracjiPierwotnej IS NULL;
OPEN cur2;
FETCH NEXT FROM cur2 INTO @current_template_id2
WHILE @@FETCH_STATUS = 0

BEGIN
--PRINT 'Value from INSERTED '+@current_template_id2;
SET @NumerDokumentuTemp = @current_template_id2;

 IF (SELECT LEN(@NumerDokumentuTemp)) < 6 
	BEGIN
		SET @NumerDokumentuTemp = 1;
	END
ELSE
	BEGIN

		IF (SELECT SUBSTRING(@NumerDokumentuTemp, LEN(@NumerDokumentuTemp)-2, 1)) = '-' 
			 BEGIN
				SET @NumerDokumentuTemp = (SELECT SUBSTRING(@NumerDokumentuTemp, 1, LEN(@NumerDokumentuTemp)-3));
			 END
		ELSE IF (SELECT SUBSTRING(@NumerDokumentuTemp, LEN(@NumerDokumentuTemp)-1, 1)) = '-' 
			 BEGIN
				SET @NumerDokumentuTemp = (SELECT SUBSTRING(@NumerDokumentuTemp, 1, LEN(@NumerDokumentuTemp)-2));

			END
	END
 
SET @NumerDokumentuTemp = @NumerDokumentuTemp+'%'


--PRINT 'LOOKING FOR MIN:    '+ @NumerDokumentuTemp

UPDATE[zef2DP].[AKCU_Deklaracja]
SET DataZlozeniaDeklaracjiPierwotnej = 
(
SELECT MIN(DataZlozeniaDok) FROM [zef2DP].[AKCU_Deklaracja] WHERE NumerDokumentu = 
(
SELECT MIN(NumerDokumentu) AS NumerDokumentu FROM [zef2DP].[AKCU_Deklaracja]
 where NumerDokumentu like @NumerDokumentuTemp and NumerDokumentu is not null
)
)
WHERE NumerDokumentu like @NumerDokumentuTemp

 FETCH NEXT FROM cur2 INTO @current_template_id2;




END
CLOSE cur2
DEALLOCATE cur2

END
GO


CREATE TRIGGER [zef2DP].[tr_AKCU_Deklaracja]
   ON  [zef2DP].[AKCU_Deklaracja]


--Obecnie nieużywany
FOR INSERT AS
DECLARE @NumerDokumentuTemp nvarchar(100);

TRUNCATE TABLE [zef2DP].[AKCU_Pomoc]
BEGIN

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


	
END
GO
DISABLE TRIGGER [zef2DP].[tr_AKCU_Deklaracja]
    ON [zef2DP].[AKCU_Deklaracja];

