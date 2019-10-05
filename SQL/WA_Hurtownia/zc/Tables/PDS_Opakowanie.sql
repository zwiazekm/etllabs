CREATE TABLE [zc].[PDS_Opakowanie] (
    [Id]                      DECIMAL (19)  NOT NULL,
    [RodzajOpakowanPid]       CHAR (2)      NULL,
    [RodzajNaGranicyPid]      CHAR (2)      NULL,
    [ZnakiOpakowan]           VARCHAR (140) NULL,
    [ZnakiNaGranicy]          VARCHAR (140) NULL,
    [LiczbaSztuk]             INT           NULL,
    [LiczbaSztukNaGranicy]    INT           NULL,
    [LiczbaOpakowan]          INT           NULL,
    [LiczbaOpakowanNaGranicy] INT           NULL,
    [StanOpakowanNaGranicy]   VARCHAR (4)   NULL,
    [IdTowarPDS]              DECIMAL (19)  NULL,
    CONSTRAINT [PK_PDS_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PDS_Opakowanie_IdTowarPDS_PDS_Towar_Id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [zc].[PDS_Towar] ([Id])
);

