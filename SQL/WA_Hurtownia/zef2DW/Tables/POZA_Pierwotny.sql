CREATE TABLE [zef2DW].[POZA_Pierwotny] (
    [IdentyfikatorWpisu]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT         NOT NULL,
    [PierwotneNumer]         NVARCHAR (255) NULL,
    [PierwotneData]          DATE           NULL,
    [PierwotneRodzaj]        NVARCHAR (255) NULL,
    [DataArch]               DATE           NULL,
    [ID_Pismo_xml]           BIGINT         NULL,
    CONSTRAINT [POZA_Pierwotny_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

