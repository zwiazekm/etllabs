CREATE TABLE [zef2DW].[DVIM_Dokument] (
    [IdentyfikatorDokumentu] BIGINT         NOT NULL,
    [DataWplywu]             DATE           NULL,
    [DataZgloszeniaCelnego]  DATE           NULL,
    [DataZlozeniaVat]        DATE           NULL,
    [NumerDeklaracji]        NVARCHAR (255) NULL,
    [ArtykulUstawy]          NVARCHAR (40)  NULL,
    [NumerZgloszeniaCelnego] NVARCHAR (255) NULL,
    [DataWplywiArtb]         DATE           NULL,
    [OkresRozliczeniowy]     NVARCHAR (7)   NULL,
    [TerminPlatnosci]        DATE           NULL,
    [AdnotacjeIUwagi]        NVARCHAR (512) NULL,
    [RaportWyslaniaSK]       NVARCHAR (MAX) NULL,
    [DataArch]               DATE           NULL,
    [ID_Pismo_xml]           BIGINT         NULL,
    [operacja]               NVARCHAR (1)   NULL,
    [IdentyfikatorPodatnika] BIGINT         NULL,
    CONSTRAINT [DVIM_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

