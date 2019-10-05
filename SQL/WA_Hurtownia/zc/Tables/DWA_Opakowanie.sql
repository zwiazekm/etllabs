CREATE TABLE [zc].[DWA_Opakowanie] (
    [Id]                    DECIMAL (19) NOT NULL,
    [RodzajOpakowan]        CHAR (2)     NULL,
    [ZnakiOpakowan]         VARCHAR (42) NULL,
    [LiczbaOpakowan]        INT          NULL,
    [LiczbaSztuk]           INT          NULL,
    [StanOpakowanNaGranicy] CHAR (1)     NULL,
    [IdTowarDWA]            DECIMAL (19) NULL,
    CONSTRAINT [PK_DWA_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWA_Opakowanie_IdTowarDWA_DWA_Towar_Id] FOREIGN KEY ([IdTowarDWA]) REFERENCES [zc].[DWA_Towar] ([Id])
);

