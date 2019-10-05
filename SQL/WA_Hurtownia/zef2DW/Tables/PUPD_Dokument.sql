CREATE TABLE [zef2DW].[PUPD_Dokument] (
    [IdentyfikatorDokumentu]          BIGINT         NOT NULL,
    [DataUpadlosci]                   DATE           NULL,
    [DataUprawomocnienia]             DATE           NULL,
    [DataWydania]                     DATE           NULL,
    [DokumentArchiwalny]              NVARCHAR (5)   NULL,
    [NaliczenieOdsetek]               NVARCHAR (5)   NULL,
    [NumerPostanowieniaNadaniaRygoru] NVARCHAR (255) NULL,
    [OrganWydajacy]                   NVARCHAR (255) NULL,
    [RodzajPostanowienia]             NVARCHAR (32)  NULL,
    [RodzajUpadlosci]                 NVARCHAR (32)  NULL,
    [NumerDokumentu]                  NVARCHAR (255) NULL,
    [Upadlosc]                        NVARCHAR (32)  NULL,
    [AdnotacjeIUwagi]                 NVARCHAR (512) NULL,
    [RaportWyslaniaSK]                NVARCHAR (MAX) NULL,
    [DataArch]                        DATE           NULL,
    [ID_Pismo_xml]                    BIGINT         NULL,
    [IdentyfikatorPodatnika]          BIGINT         NOT NULL,
    CONSTRAINT [PUPD_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

