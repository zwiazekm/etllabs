CREATE TABLE [zef2DP].[GHD1_Gry] (
    [IdentyfikatorWpisu]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NULL,
    [TypGry]                 NVARCHAR (8)    NULL,
    [RodzajGry]              NVARCHAR (64)   NULL,
    [PodstawaDoplaty]        NVARCHAR (4000) NULL,
    [StawkaDoplaty]          DECIMAL (19, 4) NULL,
    [KwotaWyliczonejDoplaty] NVARCHAR (4000) NULL,
    [DataArch]               DATETIME2 (7)   NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [GHD1_Gry_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

