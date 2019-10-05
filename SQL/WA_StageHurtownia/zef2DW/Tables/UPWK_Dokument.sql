CREATE TABLE [zef2DW].[UPWK_Dokument] (
    [IdentyfikatorDokumentu]  BIGINT         NOT NULL,
    [BlokadaKorektyWgDaty]    NVARCHAR (5)   NULL,
    [BlokadaKorektyZaOkres]   NVARCHAR (5)   NULL,
    [DataDoreczenia]          DATE           NULL,
    [DataUpowaznienia]        DATE           NULL,
    [OrganWydajacy]           NVARCHAR (255) NULL,
    [JakiOkresRozliczeniowy]  NVARCHAR (16)  NULL,
    [RodzajPodatku]           NVARCHAR (64)  NULL,
    [NumerUpowaznienia]       NVARCHAR (255) NULL,
    [TypDecyzji]              NVARCHAR (255) NULL,
    [TypDochodu]              NVARCHAR (32)  NULL,
    [AdnotacjeIUwagi]         NVARCHAR (512) NULL,
    [DataZakonczeniaKontroli] DATE           NULL,
    [RaportWyslaniaSK]        NVARCHAR (MAX) NULL,
    [DataArch]                DATE           NULL,
    [ID_Pismo_xml]            BIGINT         NULL,
    [operacja]                NVARCHAR (1)   NULL,
    [IdentyfikatorPodatnika]  BIGINT         NULL,
    CONSTRAINT [UPWK_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

