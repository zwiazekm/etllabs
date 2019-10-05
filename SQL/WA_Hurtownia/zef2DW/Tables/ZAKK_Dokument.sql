CREATE TABLE [zef2DW].[ZAKK_Dokument] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [Rodzaj]                 NVARCHAR (255)  NULL,
    [NumerDokumentu]         NVARCHAR (255)  NULL,
    [Odbiorca]               NVARCHAR (4000) NULL,
    [AdresDostawy]           NVARCHAR (4000) NULL,
    [NumerPodatnikaOdbiorca] NVARCHAR (4000) NULL,
    [Dostawca]               NVARCHAR (4000) NULL,
    [AdresDostawcy]          NVARCHAR (4000) NULL,
    [NumerPodatnikaDostawca] NVARCHAR (4000) NULL,
    [AdresWysylki]           NVARCHAR (4000) NULL,
    [DataWysylki]            DATE            NULL,
    [Przewoznik]             NVARCHAR (255)  NULL,
    [WidAdresDostawy]        NVARCHAR (4000) NULL,
    [DataDostawy]            DATE            NULL,
    [DataNrFaktury]          DATE            NULL,
    [RodzajPotwierdzenia]    NVARCHAR (255)  NULL,
    [KwotaAkcyzyRazem]       DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [IdentyfikatorPodatnika] BIGINT          NOT NULL,
    CONSTRAINT [ZAKK_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

