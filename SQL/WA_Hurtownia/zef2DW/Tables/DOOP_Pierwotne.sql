CREATE TABLE [zef2DW].[DOOP_Pierwotne] (
    [IdentyfikatorWpisu]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT         NOT NULL,
    [PierwotneRodzaj]        NVARCHAR (255) NULL,
    [PierwotneNumer]         NVARCHAR (255) NULL,
    [DataArch]               DATE           NULL,
    [ID_Pismo_xml]           BIGINT         NULL,
    CONSTRAINT [DOOP_Pierwotne_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

