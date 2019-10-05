CREATE TABLE [zc].[ZWU_Opakowanie] (
    [Id]                    DECIMAL (19)  NOT NULL,
    [RodzajOpakowan]        CHAR (2)      NULL,
    [ZnakiOpakowan]         NVARCHAR (42) NULL,
    [LiczbaOpak]            INT           NULL,
    [LiczbaSztuk]           INT           NULL,
    [StanOpakowanNaGranicy] CHAR (1)      NOT NULL,
    [IdTowarZWU]            DECIMAL (19)  NOT NULL,
    CONSTRAINT [PK_ZWU_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_Opakowanie_IdTowarZWU_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

