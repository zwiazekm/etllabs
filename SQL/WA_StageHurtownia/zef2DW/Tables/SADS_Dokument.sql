﻿CREATE TABLE [zef2DW].[SADS_Dokument] (
    [IdentyfikatorDokumentu]                    BIGINT          NOT NULL,
    [DataPowiadomienia]                         DATE            NULL,
    [DataPowstaniaDluguCelnego]                 DATE            NULL,
    [DataSprostowania]                          DATE            NULL,
    [DataZgloszeniaCelnego]                     DATE            NULL,
    [DataZwolnieniaTowaru]                      DATE            NULL,
    [KwotaZabezpieczeniaTSW]                    DECIMAL (19, 2) NULL,
    [NazwaZglaszajacego]                        NVARCHAR (255)  NULL,
    [NipZglaszajacego]                          NVARCHAR (255)  NULL,
    [NumerPozwolenia]                           NVARCHAR (255)  NULL,
    [NumerZglaszajacego]                        NVARCHAR (32)   NULL,
    [OdroczonyTerminPlatnosci]                  DATE            NULL,
    [PeselZglaszajacego]                        NVARCHAR (255)  NULL,
    [PierwotnyNumerBiznesowy]                   NVARCHAR (255)  NULL,
    [PozycjeRazem]                              DECIMAL (19, 2) NULL,
    [RazemBezZwol]                              DECIMAL (19, 2) NULL,
    [ProceduraCelna]                            INT             NULL,
    [RegonZglaszajacy]                          NVARCHAR (4000) NULL,
    [RodzajZgloszenia]                          NVARCHAR (32)   NULL,
    [NrZgloszeniaCelnego]                       NVARCHAR (255)  NULL,
    [WpisDoRejestruDluguCelnego]                NVARCHAR (5)    NULL,
    [ZglaszajacyGmina]                          NVARCHAR (4000) NULL,
    [ZglaszajacyKodPocztowy]                    NVARCHAR (4000) NULL,
    [ZglaszajacyKraj]                           NVARCHAR (4000) NULL,
    [ZglaszajacyMiejscowosc]                    NVARCHAR (4000) NULL,
    [ZglaszajacyNrDokumentu]                    NVARCHAR (4000) NULL,
    [ZglaszajacyNrDomu]                         NVARCHAR (4000) NULL,
    [ZglaszajacyNrEori]                         NVARCHAR (4000) NULL,
    [ZglaszajacyNrLokalu]                       NVARCHAR (4000) NULL,
    [ZglaszajacyNumerVatUe]                     NVARCHAR (4000) NULL,
    [ZglaszajacyPoczta]                         NVARCHAR (4000) NULL,
    [ZglaszajacyPowiat]                         NVARCHAR (4000) NULL,
    [ZglaszajacyUlica]                          NVARCHAR (4000) NULL,
    [ZglaszajacyUwagi]                          NVARCHAR (4000) NULL,
    [ZglaszajacyWojewodztwo]                    NVARCHAR (4000) NULL,
    [DataUrodzeniaZglaszajacego]                DATE            NULL,
    [ImieZglaszajacego]                         NVARCHAR (4000) NULL,
    [NazwaPelnaZglaszajacego]                   NVARCHAR (4000) NULL,
    [NazwiskoZglaszajacego]                     NVARCHAR (4000) NULL,
    [RodzajZglaszajacego]                       NVARCHAR (64)   NULL,
    [ZglaszajacySystem]                         NVARCHAR (8)    NULL,
    [AdnotacjeIUwagi]                           NVARCHAR (512)  NULL,
    [RaportWyslaniaSK]                          NVARCHAR (MAX)  NULL,
    [NumerZabezpieczeniaGeneralnego]            NVARCHAR (255)  NULL,
    [KwotaZabezpieczeniaGeneralnego]            DECIMAL (19, 2) NULL,
    [DataObciazeniaZabezpieczeniaGeneralnego]   DATE            NULL,
    [CzyZabezpieczenieGeneralneObciazaAIS]      NVARCHAR (5)    NULL,
    [NumerZabezpieczniaJednorazowego]           NVARCHAR (4000) NULL,
    [KwotaZabezpieczeniaJednorazowego]          DECIMAL (19, 2) NULL,
    [DataObciazeniaZabezpieczeniaJednorazowego] DATE            NULL,
    [NIPKontrahentaZabezpieczeniaJednorazowego] NVARCHAR (10)   NULL,
    [DataArch]                                  DATE            NULL,
    [ID_Pismo_xml]                              BIGINT          NULL,
    [operacja]                                  NVARCHAR (1)    NULL,
    [AIS]                                       NVARCHAR (5)    NULL,
    [TerminPlatnosci]                           DATE            NULL,
    [IdentyfikatorPodatnika]                    BIGINT          NULL,
    [DataRejestracjiRDC]                        DATE            NULL,
    CONSTRAINT [SADS_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

