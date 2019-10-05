CREATE TABLE [aes2].[DWA_Opakowanie] (
    [Id]                    NUMERIC (19)  NOT NULL,
    [LiczbaOpakowan]        INT           NULL,
    [LiczbaSztuk]           INT           NULL,
    [StanOpakowanNaGranicy] NCHAR (1)     NULL,
    [RodzajOpakowan]        NVARCHAR (2)  NULL,
    [RodzajOpakowanPid]     INT           NULL,
    [ZnakiOpakowan]         NVARCHAR (42) NULL,
    [IdTowarDWA]            NUMERIC (19)  NULL,
    CONSTRAINT [DWA_Opakowanie$PK_DWA_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWA_Opakowanie_IdTowarDWA__DWA_Towar_id] FOREIGN KEY ([IdTowarDWA]) REFERENCES [aes2].[DWA_Towar] ([Id])
);

