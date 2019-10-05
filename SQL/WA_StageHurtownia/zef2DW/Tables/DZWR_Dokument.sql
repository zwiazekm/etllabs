﻿CREATE TABLE [zef2DW].[DZWR_Dokument] (
    [IdentyfikatorDokumentu]                BIGINT         NOT NULL,
    [DataDecyzji]                           DATE           NULL,
    [DataPoczatkuNaliczeniaOproc]           DATE           NULL,
    [DataUiszczenia]                        DATE           NULL,
    [ParametryWniosku]                      NVARCHAR (50)  NULL,
    [DokumentArchiwalny]                    NVARCHAR (5)   NULL,
    [AdnotacjeIUwagi]                       NVARCHAR (512) NULL,
    [RodzajPodatku]                         NVARCHAR (64)  NULL,
    [NumerDecyzji]                          NVARCHAR (255) NULL,
    [WWynikuKontroliPostepowania]           NVARCHAR (12)  NULL,
    [TerminZwrotu]                          DATE           NULL,
    [TypDochodu]                            NVARCHAR (32)  NULL,
    [WpisDoRejestru]                        NVARCHAR (5)   NULL,
    [NrPostanowieniaOWszczeciuPostepowania] NVARCHAR (255) NULL,
    [NrUpowaznienia]                        NVARCHAR (255) NULL,
    [WynikKontroliNumerWniosku]             NVARCHAR (255) NULL,
    [WnioskodawcaPostepowania]              NVARCHAR (25)  NULL,
    [RaportWyslaniaSK]                      NVARCHAR (MAX) NULL,
    [DataArch]                              DATE           NULL,
    [ID_Pismo_xml]                          BIGINT         NULL,
    [operacja]                              NVARCHAR (1)   NULL,
    [IdentyfikatorPodatnika]                BIGINT         NULL,
    [KodJednostki]                          NVARCHAR (6)   NULL,
    [DataRejestracjiRDC]                    DATE           NULL,
    CONSTRAINT [DZWR_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

