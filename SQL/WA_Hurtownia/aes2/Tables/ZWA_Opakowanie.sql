CREATE TABLE [aes2].[ZWA_Opakowanie] (
    [Id]                    NUMERIC (19)   NOT NULL,
    [LiczbaOpakowan]        INT            NULL,
    [RodzajOpakowan]        NVARCHAR (2)   NULL,
    [RodzajOpakowanPid]     NVARCHAR (2)   NULL,
    [LiczbaSztuk]           INT            NULL,
    [StanOpakowanNaGranicy] NCHAR (1)      NOT NULL,
    [ZnakiOpakowan]         NVARCHAR (126) NULL,
    [IdTowarZWA]            NUMERIC (19)   NULL,
    CONSTRAINT [ZWA_Opakowanie$PK_ZWA_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWA_Opakowanie_IdTowarZWA__ZWA_Towar_id] FOREIGN KEY ([IdTowarZWA]) REFERENCES [aes2].[ZWA_Towar] ([Id])
);

