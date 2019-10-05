CREATE TABLE [zc].[ZWA_Opakowanie] (
    [Id]                    DECIMAL (19)  NOT NULL,
    [RodzajOpakowan]        CHAR (2)      NULL,
    [RodzajOpakowanPid]     INT           NULL,
    [ZnakiOpakowan]         NVARCHAR (42) NULL,
    [LiczbaOpak]            INT           NULL,
    [LiczbaSztuk]           INT           NULL,
    [StanOpakowanNaGranicy] CHAR (1)      NULL,
    [IdTowarZWA]            DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWA_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

