CREATE TABLE [zef2DP].[INF_Informacja_F] (
    [IdentyfikatorDokumentu]                         BIGINT          NOT NULL,
    [LoginUzytkownikaWprowadzDok]                    NVARCHAR (255)  NULL,
    [CzyZweryfikowany]                               NVARCHAR (5)    NULL,
    [NIPLubPESELPodatnika]                           NVARCHAR (18)   NULL,
    [NumerDokumentu]                                 NVARCHAR (255)  NULL,
    [NumerPaczki]                                    NVARCHAR (255)  NULL,
    [SystemZrodlowy]                                 NVARCHAR (8)    NULL,
    [StatusDokumentu]                                NVARCHAR (4000) NULL,
    [NumerVATUE]                                     NVARCHAR (4000) NULL,
    [DeklaracjaZaOkres]                              NVARCHAR (7)    NULL,
    [UrzadCelny]                                     NVARCHAR (255)  NULL,
    [UrzadSkarbowyDoKtoregoAdresowaneNazwa]          NVARCHAR (4000) NULL,
    [DeklaracjaCzyKorekta]                           INT             NULL,
    [DataZlozeniaDok]                                DATETIME2 (7)   NULL,
    [DataWplywuDok]                                  DATETIME2 (7)   NULL,
    [NumerDokumentuPierwotnego]                      NVARCHAR (255)  NULL,
    [RodzajKorekty]                                  NVARCHAR (32)   NULL,
    [DataDoreczeniaKorektyZUrzedu]                   DATETIME2 (7)   NULL,
    [DataDoWniesieniaSprzeciwu]                      DATETIME2 (7)   NULL,
    [CzySprzeciwDoKorektyZUrzedu]                    NVARCHAR (5)    NULL,
    [NumerAkcyzowySkladuPodatnika]                   NVARCHAR (255)  NULL,
    [NumerAkcyzowySkladu]                            NVARCHAR (64)   NULL,
    [AdresSkladu]                                    NVARCHAR (4000) NULL,
    [ZapasPoczatkowyPapierosySzt]                    DECIMAL (19, 4) NULL,
    [ZapasPoczatCygaraSzt]                           DECIMAL (19, 4) NULL,
    [ZapasPoczatTytonKg]                             DECIMAL (19, 4) NULL,
    [KwotaOdpowZapasPoczatkPapierosy]                DECIMAL (19, 4) NULL,
    [KwotaOdpowZapasPoczatkCygara]                   DECIMAL (19, 4) NULL,
    [KwotaOdpowZapasPoczatkTyton]                    DECIMAL (19, 4) NULL,
    [IloscWyrobPrzyjetaNaSkladPapierosySzt]          DECIMAL (19, 4) NULL,
    [IloscWyrobPrzyjetaNaSkladCygaraSzt]             DECIMAL (19, 4) NULL,
    [IloscWyrobPrzyjetaNaSkladTytonKg]               DECIMAL (19, 4) NULL,
    [IloscWyprodukWyrobAkcPapierosySzt]              DECIMAL (19, 4) NULL,
    [IloscWyprodukWyrobAkcCygaraSzt]                 DECIMAL (19, 4) NULL,
    [IloscWyprodukWyrobAkcTytonKg]                   DECIMAL (19, 4) NULL,
    [IloscWyrobZeSkladPapierosySzt]                  DECIMAL (19, 4) NULL,
    [IloscWyrobZeSkladCygaraSzt]                     DECIMAL (19, 4) NULL,
    [IloscWyrobZeSkladTytonKg]                       DECIMAL (19, 4) NULL,
    [IloscWyrobZeSkladWprocedZawieszPapierosySzt]    DECIMAL (19, 4) NULL,
    [IloscWyrobZeSkladWprocedZawieszCygaraSzt]       DECIMAL (19, 4) NULL,
    [IloscWyrobZeSkladWprocedZawieszTytonKg]         DECIMAL (19, 4) NULL,
    [IloscWyrobZeSkladPozaProcedZawieszPapierosySzt] DECIMAL (19, 4) NULL,
    [IloscWyrobZeSkladPozaProcedZawieszCygaraSzt]    DECIMAL (19, 4) NULL,
    [IloscWyrobZeSkladPozaProcedZawieszTytonKg]      DECIMAL (19, 4) NULL,
    [UbytkiCalkowZniszczPapierosySzt]                DECIMAL (19, 4) NULL,
    [UbytkiCalkowZniszczCygaraSzt]                   DECIMAL (19, 4) NULL,
    [UbytkiCalkowZniszczTytonKg]                     DECIMAL (19, 4) NULL,
    [ZapasKoncowyPapierosySzt]                       DECIMAL (19, 4) NULL,
    [ZapasKoncowyCygaraSzt]                          DECIMAL (19, 4) NULL,
    [ZapasKoncowyTytonKg]                            DECIMAL (19, 4) NULL,
    [KwotaOdpowZapasKoncowPapierosy]                 DECIMAL (19, 4) NULL,
    [KwotaOdpowZapasKoncowCygara]                    DECIMAL (19, 4) NULL,
    [KwotaOdpowZapasKoncowTyton]                     DECIMAL (19, 4) NULL,
    [ImiePelnomocnika]                               NVARCHAR (4000) NULL,
    [NazwiskoPelnomocnika]                           NVARCHAR (4000) NULL,
    [TelefonPodatnikaLubPelnomocnika]                NVARCHAR (4000) NULL,
    [EmailPodatnikaLubPelnomocnika]                  NVARCHAR (4000) NULL,
    [SprawdzPelnomocnictwa]                          NVARCHAR (5)    NULL,
    [UwagiUrzeduCelnego]                             NVARCHAR (4000) NULL,
    [DataZlozeniaDeklaracjiPierwotnej]               DATETIME2 (7)   NULL,
    [CzyOstatniaWersjaDeklaracji]                    NVARCHAR (5)    NULL,
    [DataArch]                                       DATETIME2 (7)   NULL,
    [ID_Pismo_xml]                                   BIGINT          NULL,
    [FormaZlozeniaDok]                               NVARCHAR (255)  NULL,
    CONSTRAINT [INF_Informacja_F_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DP]
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160803-121515]
    ON [zef2DP].[INF_Informacja_F]([NumerDokumentu] ASC)
    ON [FG_ZEF2DP];


GO
CREATE TRIGGER [zef2DP].[INFF_DeklaracjaTrigger]
   ON  zef2DP.INF_Informacja_F
   AFTER INSERT,UPDATE
AS 
BEGIN

DECLARE @current_template_id nvarchar(100);
DECLARE @current_template_id2 nvarchar(100);
DECLARE @NumerDokumentuTemp nvarchar(100);



DECLARE cur2 CURSOR FOR  
SELECT NumerDokumentu From INSERTED;
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
--PRINT 'Value after IF      '+@NumerDokumentuTemp;

DECLARE cur CURSOR FOR
SELECT NumerDokumentu
FROM [zef2DP].[INF_Informacja_F]
WHERE NumerDokumentu like @NumerDokumentuTemp;
OPEN cur;

FETCH NEXT FROM cur INTO @current_template_id

WHILE @@FETCH_STATUS = 0
BEGIN

 UPDATE [zef2DP].[INF_Informacja_F] SET CzyOstatniaWersjaDeklaracji = 'false' WHERE NumerDokumentu = @current_template_id;

  FETCH NEXT FROM cur INTO @current_template_id;


END
CLOSE cur
DEALLOCATE cur
--PRINT 'LOOKING FOR MAX:    '+ @NumerDokumentuTemp
UPDATE[zef2DP].[INF_Informacja_F]
SET CzyOstatniaWersjaDeklaracji = 'true' 
WHERE NumerDokumentu = 
 (SELECT MAX(NumerDokumentu) AS NumerDokumentu FROM [zef2DP].[INF_Informacja_F]
 where NumerDokumentu like @NumerDokumentuTemp and StatusDokumentu not like 'Anulowany%') and StatusDokumentu not like 'Anulowany%'
 
FETCH NEXT FROM cur2 INTO @current_template_id2;


END
CLOSE cur2
DEALLOCATE cur2

END