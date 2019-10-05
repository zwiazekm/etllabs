CREATE TABLE [zef2DW].[OKAR_Dokument] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataOrzeczenia]         DATE            NULL,
    [DataUprawomocnienia]    DATE            NULL,
    [DokumentArchiwalny]     NVARCHAR (5)    NULL,
    [KwotaWplaty]            DECIMAL (19, 2) NULL,
    [NumerDokWplaty]         NVARCHAR (255)  NULL,
    [PozycjeKwotaRazem]      DECIMAL (19, 2) NULL,
    [AdnotacjeIUwagi]        NVARCHAR (512)  NULL,
    [NumerOrzeczenia]        NVARCHAR (255)  NULL,
    [MigracjaReczna]         NVARCHAR (5)    NULL,
    [RaportWyslaniaSK]       NVARCHAR (MAX)  NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [IdentyfikatorPodatnika] BIGINT          NOT NULL,
    CONSTRAINT [OKAR_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

