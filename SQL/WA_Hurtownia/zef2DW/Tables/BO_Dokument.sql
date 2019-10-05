CREATE TABLE [zef2DW].[BO_Dokument] (
    [IdentyfikatorDokumentu]      BIGINT          NOT NULL,
    [DokumentArchiwalny]          NVARCHAR (5)    NULL,
    [Typ]                         NVARCHAR (32)   NULL,
    [NumerDokumentu]              NVARCHAR (255)  NULL,
    [RodzajDokumentuArchiwalnego] NVARCHAR (50)   NULL,
    [DataWystawienia]             DATE            NULL,
    [OkresRozliczeniowy]          NVARCHAR (7)    NULL,
    [TerminPlatnosci]             DATE            NULL,
    [OrganWydajacy]               NVARCHAR (255)  NULL,
    [DecyzjaWydanaPrzez]          NVARCHAR (25)   NULL,
    [AdnotacjeIUwagi]             NVARCHAR (512)  NULL,
    [PozycjeKwotaRazem]           DECIMAL (19, 2) NULL,
    [RaportWyslaniaSK]            NVARCHAR (MAX)  NULL,
    [DataArch]                    DATE            NULL,
    [ID_Pismo_xml]                BIGINT          NULL,
    [IdentyfikatorPodatnika]      BIGINT          NOT NULL,
    CONSTRAINT [BO_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

