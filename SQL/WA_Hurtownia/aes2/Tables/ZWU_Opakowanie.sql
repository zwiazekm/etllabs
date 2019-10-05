CREATE TABLE [aes2].[ZWU_Opakowanie] (
    [Id]                    NUMERIC (19)   NOT NULL,
    [LiczbaOpakowan]        INT            NULL,
    [RodzajOpakowan]        NVARCHAR (2)   NULL,
    [RodzajOpakowanPid]     NVARCHAR (2)   NULL,
    [LiczbaSztuk]           INT            NULL,
    [StanOpakowanNaGranicy] NCHAR (1)      NOT NULL,
    [ZnakiOpakowan]         NVARCHAR (126) NULL,
    [IdTowarZWU]            NUMERIC (19)   NULL,
    CONSTRAINT [ZWU_Opakowanie$PK_ZWU_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_Opakowanie_IdTowarZWU_ZWU_Towar_id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [aes2].[ZWU_Towar] ([Id])
);

