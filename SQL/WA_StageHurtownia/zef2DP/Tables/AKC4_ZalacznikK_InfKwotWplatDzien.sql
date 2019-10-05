CREATE TABLE [zef2DP].[AKC4_ZalacznikK_InfKwotWplatDzien] (
    [IdentyfikatorZalacznika]                     NVARCHAR (255)  NOT NULL,
    [DataPowstaniaObowPodatk]                     DATETIME2 (7)   NULL,
    [KwotaPodatkuAkcZDniaPowstaniaObowPodatk]     DECIMAL (19, 2) NULL,
    [DataDokonaniaWplatyDziennej]                 DATETIME2 (7)   NULL,
    [KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne] DECIMAL (19, 2) NULL,
    [KwotaDokonanejWplatyDziennej]                DECIMAL (19, 2) NULL,
    [id1]                                         NVARCHAR (150)  NULL,
    [operacja]                                    NVARCHAR (1)    NULL
);

