CREATE TABLE [zc].[DWU_Opakowanie] (
    [Id]             DECIMAL (19) NOT NULL,
    [LiczbaSztuk]    INT          NULL,
    [RodzajOpakowan] CHAR (2)     NULL,
    [ZnakiOpakowan]  VARCHAR (42) NULL,
    [LiczbaOpakowan] INT          NULL,
    [IdTowarDWU]     DECIMAL (19) NULL,
    CONSTRAINT [PK_DWU_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWU_Opakowanie_IdTowarDWU_DWU_Towar_Id] FOREIGN KEY ([IdTowarDWU]) REFERENCES [zc].[DWU_Towar] ([Id])
);

