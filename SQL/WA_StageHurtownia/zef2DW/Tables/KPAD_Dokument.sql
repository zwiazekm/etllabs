CREATE TABLE [zef2DW].[KPAD_Dokument] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataPostanowienia]      DATE            NULL,
    [DokumentArchiwalny]     NVARCHAR (5)    NULL,
    [KwotaOplatyRazem]       DECIMAL (19, 2) NULL,
    [NumerPostanowienia]     NVARCHAR (255)  NULL,
    [ZrodloFinansowania]     NVARCHAR (1)    NULL,
    [AdnotacjeIUwagi]        NVARCHAR (512)  NULL,
    [MigracjaReczna]         NVARCHAR (5)    NULL,
    [RaportWyslaniaSK]       NVARCHAR (MAX)  NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL,
    [DataPowiadomienia]      DATE            NULL,
    [TerminPlatnosci]        DATE            NULL,
    [IdentyfikatorPodatnika] BIGINT          NULL,
    CONSTRAINT [KPAD_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

