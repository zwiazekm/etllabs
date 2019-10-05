CREATE TABLE [zef2DW].[DUOD_Dokument] (
    [IdentyfikatorDokumentu]                BIGINT         NOT NULL,
    [DataDecyzji]                           DATE           NULL,
    [DataDoreczenia]                        DATE           NULL,
    [NumerDecyzji]                          NVARCHAR (255) NULL,
    [WWynikuKontroliPostepowania]           NVARCHAR (12)  NULL,
    [NrUpowaznienia]                        NVARCHAR (255) NULL,
    [NrPostanowieniaOWszczeciuPostepowania] NVARCHAR (255) NULL,
    [WynikKontroliNumerWniosku]             NVARCHAR (255) NULL,
    [PierwotnyRodzaj]                       NVARCHAR (255) NULL,
    [AdnotacjeIUwagi]                       NVARCHAR (512) NULL,
    [PierwotnyNumer]                        NVARCHAR (255) NULL,
    [WnioskodawcaPostepowania]              NVARCHAR (25)  NULL,
    [DataArch]                              DATE           NULL,
    [ID_Pismo_xml]                          BIGINT         NULL,
    [operacja]                              NVARCHAR (1)   NULL,
    [IdentyfikatorPodatnika]                BIGINT         NULL,
    CONSTRAINT [DUOD_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

