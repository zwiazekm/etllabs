CREATE TABLE [zef2DP].[AKCU_Pomoc] (
    [IdentyfikatorDokumentu]      BIGINT          NOT NULL,
    [NumerDokumentuMain]          NVARCHAR (255)  NULL,
    [NumerDokumentuRest]          NVARCHAR (50)   NULL,
    [StatusDokumentu]             NVARCHAR (4000) NULL,
    [CzyOstatniaWersjaDeklaracji] NCHAR (5)       NULL
);


GO
CREATE CLUSTERED INDEX [ClusteredIndex-20160809-142007]
    ON [zef2DP].[AKCU_Pomoc]([IdentyfikatorDokumentu] ASC)
    ON [FG_ZEF2DP];

