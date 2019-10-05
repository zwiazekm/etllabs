CREATE TABLE [zef2DP].[AKCUS_Pomoc] (
    [IdentyfikatorDokumentu]      BIGINT          NOT NULL,
    [NumerDokumentuMain]          NVARCHAR (255)  NULL,
    [NumerDokumentuRest]          NVARCHAR (50)   NULL,
    [StatusDokumentu]             NVARCHAR (4000) NULL,
    [CzyOstatniaWersjaDeklaracji] NCHAR (5)       NULL,
    [DataZlozeniaDok]             DATETIME2 (7)   NULL
) ON [FG_ZEF2DP];

