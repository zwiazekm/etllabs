CREATE TABLE [zef2DW].[DOPN_Pierwotny] (
    [IdentyfikatorWpisu]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [PierwotnyRodzajDokumentu] NVARCHAR (255) NULL,
    [PierwotnyNumerDokumentu]  NVARCHAR (255) NULL,
    [DataArch]                 DATE           NULL,
    [ID_Pismo_xml]             BIGINT         NULL,
    CONSTRAINT [DOPN_Pierwotny_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

