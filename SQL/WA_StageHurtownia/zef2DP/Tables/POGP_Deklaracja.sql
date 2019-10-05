﻿CREATE TABLE [zef2DP].[POGP_Deklaracja] (
    [IdentyfikatorDokumentu]                BIGINT          NOT NULL,
    [LoginUzytkownikaWprowadzDok]           NVARCHAR (255)  NULL,
    [CzyZweryfikowany]                      NVARCHAR (5)    NULL,
    [NIPLubPESELPodatnika]                  NVARCHAR (18)   NULL,
    [NumerDokumentu]                        NVARCHAR (255)  NULL,
    [NumerPaczki]                           NVARCHAR (255)  NULL,
    [SystemZrodlowy]                        NVARCHAR (8)    NULL,
    [StatusDokumentu]                       NVARCHAR (4000) NULL,
    [NumerVATUE]                            NVARCHAR (4000) NULL,
    [Zarachowanie]                          NVARCHAR (5)    NULL,
    [PowodZarachowania]                     NVARCHAR (4000) NULL,
    [DeklaracjaZaOkres]                     NVARCHAR (7)    NULL,
    [UrzadSkarbowyDoKtoregoAdresowaneKod]   NVARCHAR (6)    NULL,
    [UrzadSkarbowyDoKtoregoAdresowaneNazwa] NVARCHAR (4000) NULL,
    [UrzadZlozenia]                         NVARCHAR (6)    NULL,
    [DeklaracjaCzyKorekta]                  INT             NULL,
    [DataZlozeniaDok]                       DATETIME2 (7)   NULL,
    [DataWplywuDok]                         DATETIME2 (7)   NULL,
    [NumerDokumentuPierwotnego]             NVARCHAR (255)  NULL,
    [UzasadnienieKorekty]                   NVARCHAR (4000) NULL,
    [RodzajKorekty]                         NVARCHAR (32)   NULL,
    [DataDoreczeniaKorektyZUrzedu]          DATETIME2 (7)   NULL,
    [DataDoWniesieniaSprzeciwu]             DATETIME2 (7)   NULL,
    [CzySprzeciwDoKorektyZUrzedu]           NVARCHAR (5)    NULL,
    [PodstawaOpodatkowania]                 DECIMAL (19, 2) NULL,
    [StawkaPodatku]                         DECIMAL (19, 4) NULL,
    [KwotaPobranegoPodatku]                 DECIMAL (19, 4) NULL,
    [KwotaPotraconegoWynagrodzenia]         DECIMAL (19, 4) NULL,
    [KwotaDoWplaty]                         DECIMAL (19, 2) NULL,
    [ImiePelnomocnika]                      NVARCHAR (4000) NULL,
    [NazwiskoPelnomocnika]                  NVARCHAR (4000) NULL,
    [TelefonPodatnikaLubPelnomocnika]       NVARCHAR (4000) NULL,
    [EmailPodatnikaLubPelnomocnika]         NVARCHAR (4000) NULL,
    [UwagiUrzeduSkarbowego]                 NVARCHAR (4000) NULL,
    [SprawdzPelnomocnictwa]                 NVARCHAR (5)    NULL,
    [WynikSprawdzeniaPelnomocnictwa]        NVARCHAR (3)    NULL,
    [DataZlozeniaDeklaracjiPierwotnej]      DATETIME2 (7)   NULL,
    [CzyOstatniaWersjaDeklaracji]           NVARCHAR (5)    NULL,
    [DataArch]                              DATETIME2 (7)   NULL,
    [ID_Pismo_xml]                          BIGINT          NULL,
    [operacja]                              NVARCHAR (1)    NULL,
    [KwotaDoWplatySPR]                      DECIMAL (19, 2) NULL,
    [FormaZlozeniaDok]                      NVARCHAR (255)  NULL,
    CONSTRAINT [POGP_Deklaracja_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

