﻿CREATE TABLE [zef2DP].[AKC4_Deklaracja] (
    [IdentyfikatorDokumentu]                       BIGINT          NOT NULL,
    [LoginUzytkownikaWprowadzDok]                  NVARCHAR (255)  NULL,
    [RodzajDokumentu]                              NVARCHAR (8)    NULL,
    [NIPLubPESELPodatnika]                         NVARCHAR (18)   NULL,
    [CzyZweryfikowany]                             NVARCHAR (5)    NULL,
    [SystemZrodlowy]                               NVARCHAR (8)    NULL,
    [NumerDokumentu]                               NVARCHAR (255)  NULL,
    [NumerPaczki]                                  NVARCHAR (255)  NULL,
    [IdDokumentuPowiazanegoAKCPA]                  NVARCHAR (4000) NULL,
    [NumerVATUE]                                   NVARCHAR (4000) NULL,
    [StatusDokumentu]                              NVARCHAR (4000) NULL,
    [Zarachowanie]                                 NVARCHAR (5)    NULL,
    [PowodZarachowania]                            NVARCHAR (4000) NULL,
    [DeklaracjaZaOkres]                            NVARCHAR (7)    NULL,
    [UrzadCelny]                                   NVARCHAR (255)  NULL,
    [UrzadSkarbowyDoKtoregoAdresowaneNazwa]        NVARCHAR (4000) NULL,
    [IdUrzeduCelnego]                              NVARCHAR (255)  NULL,
    [DeklaracjaCzyKorekta]                         INT             NULL,
    [NumerDokumentuPierwotnego]                    NVARCHAR (255)  NULL,
    [UzasadnienieKorekty]                          NVARCHAR (4000) NULL,
    [RodzajKorekty]                                NVARCHAR (32)   NULL,
    [DataDoreczeniaKorektyZUrzedu]                 DATETIME2 (7)   NULL,
    [DataDoWniesieniaSprzeciwu]                    DATETIME2 (7)   NULL,
    [CzySprzeciwDoKorektyZUrzedu]                  NVARCHAR (5)    NULL,
    [RazemPodatekAkcyzowy]                         DECIMAL (19, 2) NULL,
    [KwotaZnakowAkcyzy]                            DECIMAL (19, 2) NULL,
    [KwotaWplatDziennych]                          DECIMAL (19, 2) NULL,
    [KwotaPrzedplatyAkcyzy]                        DECIMAL (19, 4) NULL,
    [NadwyzWplatDoRozliczOstatDeklar]              DECIMAL (19, 4) NULL,
    [NadwyzWplatDoRozliczPrzedplataAkcOstatDeklar] DECIMAL (19, 4) NULL,
    [DoZaplaty]                                    DECIMAL (19, 2) NULL,
    [NadwyzWplatDoRozlicz]                         DECIMAL (19, 4) NULL,
    [NadwyzWplatDoRozliczPrzedplataAkc]            INT             NULL,
    [ImiePelnomocnika]                             NVARCHAR (4000) NULL,
    [NazwiskoPelnomocnika]                         NVARCHAR (4000) NULL,
    [TelefonPodatnikaLubPelnomocnika]              NVARCHAR (4000) NULL,
    [EmailPodatnikaLubPelnomocnika]                NVARCHAR (4000) NULL,
    [UwagiUrzeduCelnego]                           NVARCHAR (4000) NULL,
    [DataZlozeniaDok]                              DATETIME2 (7)   NULL,
    [DataWplywuDok]                                DATETIME2 (7)   NULL,
    [DeklaracjaZerowa]                             NVARCHAR (5)    NULL,
    [DataZlozeniaDeklaracjiPierwotnej]             DATETIME2 (7)   NULL,
    [CzyOstatniaWersjaDeklaracji]                  NVARCHAR (5)    NULL,
    [DataArch]                                     DATETIME2 (7)   NULL,
    [ID_Pismo_xml]                                 BIGINT          NULL,
    [operacja]                                     NVARCHAR (1)    NULL,
    [MigracjaReczna]                               NVARCHAR (5)    NULL,
    [FormaZlozeniaDok]                             NVARCHAR (255)  NULL,
    CONSTRAINT [AKC4_Deklaracja_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

