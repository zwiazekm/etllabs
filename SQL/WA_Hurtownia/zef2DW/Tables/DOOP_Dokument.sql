CREATE TABLE [zef2DW].[DOOP_Dokument] (
    [IdentyfikatorDokumentu]         BIGINT          NOT NULL,
    [TypDochodu]                     NVARCHAR (32)   NULL,
    [DataDecyzji]                    DATE            NULL,
    [NumerDecyzji]                   NVARCHAR (255)  NULL,
    [DataDoreczenia]                 DATE            NULL,
    [DataWniosku]                    DATE            NULL,
    [NumerWniosku]                   NVARCHAR (255)  NULL,
    [AnulowanoOdroczenia]            NVARCHAR (5)    NULL,
    [PozycjeSumaOdroczona]           DECIMAL (19, 2) NULL,
    [PozycjeSumaOdsetki]             DECIMAL (19, 2) NULL,
    [PozycjeSumaOplataProlongacyjna] DECIMAL (19, 2) NULL,
    [RejestracjaKontrahenta]         NVARCHAR (5)    NULL,
    [AdnotacjeIUwagi]                NVARCHAR (512)  NULL,
    [RaportWyslaniaSK]               NVARCHAR (MAX)  NULL,
    [DataArch]                       DATE            NULL,
    [ID_Pismo_xml]                   BIGINT          NULL,
    [IdentyfikatorPodatnika]         BIGINT          NOT NULL,
    CONSTRAINT [DOOP_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

