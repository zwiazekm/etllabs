﻿CREATE TABLE [zef2DW].[ODPN_Dokument] (
    [IdentyfikatorDokumentu]                  BIGINT          NOT NULL,
    [DataWystawienia]                         DATE            NULL,
    [AdnotacjeIUwagi]                         NVARCHAR (512)  NULL,
    [PrzyczynaOdpisuPrzypisu]                 NVARCHAR (13)   NULL,
    [PrzyczynaPrzedawnienia]                  INT             NULL,
    [RodzajPodatku]                           NVARCHAR (128)  NULL,
    [NumerDokumentu]                          NVARCHAR (255)  NULL,
    [SumNaleznosc]                            DECIMAL (19, 2) NULL,
    [SumaPrzypisOdpis]                        DECIMAL (19, 2) NULL,
    [SumaSaldoKoncowe]                        DECIMAL (19, 2) NULL,
    [TypDochodu]                              NVARCHAR (32)   NULL,
    [WpisDoRejestruDluguCelnego]              NVARCHAR (5)    NULL,
    [PierwotnyNumerDokumentu]                 NVARCHAR (255)  NULL,
    [PierwotnyRodzajDokumentu]                NVARCHAR (255)  NULL,
    [PrzyczynaZadluzenia]                     INT             NULL,
    [RaportWyslaniaSK]                        NVARCHAR (MAX)  NULL,
    [KwotaZabezpieczeniaTSW]                  DECIMAL (19, 2) NULL,
    [NumerZabezpieczeniaGeneralnego]          NVARCHAR (4000) NULL,
    [KwotaZabezpieczeniaGeneralnego]          DECIMAL (19, 2) NULL,
    [DataObciazeniaZabezpieczeniaGeneralnego] DATE            NULL,
    [KwotaobciazeniaZwolnienia]               DECIMAL (19, 2) NULL,
    [DataArch]                                DATE            NULL,
    [ID_Pismo_xml]                            BIGINT          NULL,
    [IdentyfikatorPodatnika]                  BIGINT          NOT NULL,
    [DataRejestracjiRDC]                      DATE            NULL,
    [MigracjaReczna]                          NVARCHAR (5)    NULL,
    [NumerPozwoleniaSASP]                     NVARCHAR (255)  NULL,
    [OrganCelnySASP]                          NVARCHAR (255)  NULL,
    CONSTRAINT [ODPN_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

