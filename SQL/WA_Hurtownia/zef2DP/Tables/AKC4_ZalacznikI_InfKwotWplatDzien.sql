CREATE TABLE [zef2DP].[AKC4_ZalacznikI_InfKwotWplatDzien] (
    [IdentyfikatorWpisu]                          BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorZalacznika]                     NVARCHAR (255)  NULL,
    [DataPowstaniaObowPodatk]                     DATETIME2 (7)   NULL,
    [KwotaPodatkuAkcZDniaPowstaniaObowPodatk]     DECIMAL (19, 2) NULL,
    [DataDokonaniaWplatyDziennej]                 DATETIME2 (7)   NULL,
    [KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne] DECIMAL (19, 2) NULL,
    [KwotaDokonanejWplatyDziennej]                DECIMAL (19, 2) NULL,
    [id1]                                         NVARCHAR (150)  NULL,
    CONSTRAINT [AKC4_ZalacznikI_InfKwotWplatDzien_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

