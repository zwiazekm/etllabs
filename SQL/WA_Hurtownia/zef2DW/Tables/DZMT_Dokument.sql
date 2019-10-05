﻿CREATE TABLE [zef2DW].[DZMT_Dokument] (
    [IdentyfikatorDokumentu]                BIGINT         NOT NULL,
    [ParametryWniosku]                      NVARCHAR (50)  NULL,
    [DataDecyzji]                           DATE           NULL,
    [NumerDecyzji]                          NVARCHAR (255) NULL,
    [DataDoreczenia]                        DATE           NULL,
    [RodzajDeklaracji]                      NVARCHAR (32)  NULL,
    [OkresNowyTerminZlozeniaDeklaracji]     NVARCHAR (7)   NULL,
    [TerminZlozeniaDeklaracji]              DATE           NULL,
    [NowyTerminZlozeniaDeklaracji]          DATE           NULL,
    [WWynikuKontroliPostepowania]           NVARCHAR (12)  NULL,
    [NrUpowaznienia]                        NVARCHAR (255) NULL,
    [NrPostanowieniaOWszczeciuPostepowania] NVARCHAR (255) NULL,
    [WynikKontroliNumerWniosku]             NVARCHAR (255) NULL,
    [PierwotnyRodzaj]                       NVARCHAR (255) NULL,
    [PierwotnyNumer]                        NVARCHAR (255) NULL,
    [PierwotnyTerminZlozeniaDeklaracji]     DATE           NULL,
    [AdnotacjeIUwagi]                       NVARCHAR (512) NULL,
    [DataUchylenia]                         DATE           NULL,
    [UchylenieTerminuZlozeniaDeklaracji]    DATE           NULL,
    [JakiOkresRozliczeniowy]                NVARCHAR (16)  NULL,
    [WnioskodawcaPostepowania]              NVARCHAR (25)  NULL,
    [DataArch]                              DATE           NULL,
    [ID_Pismo_xml]                          BIGINT         NULL,
    [IdentyfikatorPodatnika]                BIGINT         NOT NULL,
    [RodzajDecyzji]                         NVARCHAR (255) NULL,
    [NowyTerminPlatnosci]                   DATE           NULL,
    [PierwotnyTerminPlatnosci]              DATE           NULL,
    CONSTRAINT [DZMT_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

