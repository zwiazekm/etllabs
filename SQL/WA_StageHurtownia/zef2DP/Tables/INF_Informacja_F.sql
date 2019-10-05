﻿CREATE TABLE [zef2DP].[INF_Informacja_F] (
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
    [operacja]                                       NVARCHAR (1)    NULL,
    [FormaZlozeniaDok]                               NVARCHAR (255)  NULL,
    CONSTRAINT [INF_Informacja_F_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

