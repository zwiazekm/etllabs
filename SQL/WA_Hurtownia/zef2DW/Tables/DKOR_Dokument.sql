﻿CREATE TABLE [zef2DW].[DKOR_Dokument] (
    [IdentyfikatorDokumentu]                    BIGINT          NOT NULL,
    [DokumentArchiwalny]                        NVARCHAR (5)    NULL,
    [NumerDecyzji]                              NVARCHAR (255)  NULL,
    [AdnotacjeIUwagi]                           NVARCHAR (512)  NULL,
    [NumerZabezpieczeniaGeneralnego]            NVARCHAR (4000) NULL,
    [KwotaZabezpieczeniaGeneralnego]            NVARCHAR (4000) NULL,
    [DataObciazeniaZabezpieczeniaGeneralnego]   NVARCHAR (4000) NULL,
    [CzyZabezpieczenieGeneralneObciazaAIS]      NVARCHAR (4000) NULL,
    [NumerZabezpieczniaJednorazowego]           NVARCHAR (4000) NULL,
    [KwotaZabezpieczeniaJednorazowego]          NVARCHAR (4000) NULL,
    [DataObciazeniaZabezpieczeniaJednorazowego] NVARCHAR (4000) NULL,
    [NIPKontrahentaZabezpieczeniaJednorazowego] NVARCHAR (4000) NULL,
    [MigracjaReczna]                            NVARCHAR (4000) NULL,
    [WWynikuKontroliPostepowania]               NVARCHAR (12)   NULL,
    [NrUpowaznienia]                            NVARCHAR (255)  NULL,
    [NrPostanowieniaOWszczeciuPostepowania]     NVARCHAR (255)  NULL,
    [WynikKontroliNumerWniosku]                 NVARCHAR (255)  NULL,
    [PierwotnyRodzajDokumentu]                  NVARCHAR (255)  NULL,
    [PierwotnyNumerDokumentu]                   NVARCHAR (255)  NULL,
    [AIS]                                       NVARCHAR (5)    NULL,
    [DataDecyzji]                               DATE            NULL,
    [DataPowiadomienia]                         DATE            NULL,
    [DataPowstaniaDluguCelnego]                 DATE            NULL,
    [TerminPlatnosci]                           DATE            NULL,
    [ProceduraCelna]                            INT             NULL,
    [Ownres]                                    NVARCHAR (5)    NULL,
    [WpisDoRejestruDluguCelnego]                NVARCHAR (5)    NULL,
    [RazemBezZwoln]                             DECIMAL (19, 2) NULL,
    [RazemZeZwoln]                              DECIMAL (19, 2) NULL,
    [KwotaZabezpieczeniaTSW]                    DECIMAL (19, 2) NULL,
    [WnioskodawcaPostepowania]                  NVARCHAR (25)   NULL,
    [OstatniaDecyzja]                           NVARCHAR (5)    NULL,
    [NrPozwNaProcedureUproszczona]              NVARCHAR (32)   NULL,
    [NumerPozwoleniaSASP]                       NVARCHAR (4000) NULL,
    [OrganCelnySASP]                            NVARCHAR (32)   NULL,
    [NumerPostanowieniaDodatkowego]             NVARCHAR (255)  NULL,
    [NumerZabezpieczeniaDodatkowego]            NVARCHAR (4000) NULL,
    [KwotaZabezpieczeniaDodatkowego]            DECIMAL (19, 2) NULL,
    [DataZlozeniaZabezpieczeniaDodatkowego]     DATE            NULL,
    [KwotaZwolnienia]                           DECIMAL (19, 2) NULL,
    [IdPismaPierwotnego]                        INT             NULL,
    [RaportWyslaniaSK]                          NVARCHAR (MAX)  NULL,
    [NaliczycOdsetki]                           INT             NULL,
    [PrzyczynaZadluzenia]                       INT             NULL,
    [DataArch]                                  DATE            NULL,
    [ID_Pismo_xml]                              BIGINT          NULL,
    [IdentyfikatorPodatnika]                    BIGINT          NOT NULL,
    [KodJednostki]                              NVARCHAR (6)    NULL,
    [DataRejestracjiRDC]                        DATE            NULL,
    [NaleznosciCelnoPodatkowe]                  NVARCHAR (255)  NULL,
    [StawkaOdsetek]                             NVARCHAR (255)  NULL,
    CONSTRAINT [DKOR_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

