CREATE TABLE [zc].[DWA_Opakowanie] (
    [Id]                    DECIMAL (19) NOT NULL,
    [RodzajOpakowan]        CHAR (2)     NULL,
    [RodzajOpakowanPid]     INT          NULL,
    [ZnakiOpakowan]         VARCHAR (42) NULL,
    [LiczbaOpakowan]        INT          NULL,
    [LiczbaSztuk]           INT          NULL,
    [StanOpakowanNaGranicy] CHAR (1)     NULL,
    [IdTowarDWA]            DECIMAL (19) NULL,
    CONSTRAINT [PK_DWA_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

