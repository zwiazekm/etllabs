CREATE TABLE [zef2DW].[DZWR_Pierwotny] (
    [IdentyfikatorWpisu]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT         NOT NULL,
    [PierwotneRodzaj]         NVARCHAR (255) NULL,
    [PierwotneNumer]          NVARCHAR (255) NULL,
    [PierwotneDataUiszczenia] DATE           NULL,
    [DataArch]                DATE           NULL,
    [ID_Pismo_xml]            BIGINT         NULL,
    CONSTRAINT [DZWR_Pierwotny_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

