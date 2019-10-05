CREATE TABLE [zef2DW].[UPWK_Okresy] (
    [IdentyfikatorWpisu]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]   BIGINT       NOT NULL,
    [Okres]                    NVARCHAR (7) NULL,
    [DataArch]                 DATE         NULL,
    [ID_Pismo_xml]             BIGINT       NULL,
    [DataObowiazkuPodatkowego] DATE         NULL,
    CONSTRAINT [UPWK_Okresy_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

