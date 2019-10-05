CREATE TABLE [zef2DW].[KPAD_Dokument] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataPostanowienia]      DATE            NULL,
    [DataPowiadomienia]      DATE            NULL,
    [DokumentArchiwalny]     NVARCHAR (5)    NULL,
    [KwotaOplatyRazem]       DECIMAL (19, 2) NULL,
    [NumerPostanowienia]     NVARCHAR (255)  NULL,
    [TerminPlatnosci]        DATE            NULL,
    [ZrodloFinansowania]     NVARCHAR (1)    NULL,
    [AdnotacjeIUwagi]        NVARCHAR (512)  NULL,
    [MigracjaReczna]         NVARCHAR (5)    NULL,
    [RaportWyslaniaSK]       NVARCHAR (MAX)  NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [IdentyfikatorPodatnika] BIGINT          NOT NULL,
    CONSTRAINT [KPAD_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

