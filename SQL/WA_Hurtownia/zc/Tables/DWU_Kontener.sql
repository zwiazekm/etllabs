CREATE TABLE [zc].[DWU_Kontener] (
    [Id]          DECIMAL (19) NOT NULL,
    [NrKontenera] VARCHAR (17) NULL,
    [IdTowarDWU]  DECIMAL (19) NULL,
    CONSTRAINT [PK_DWU_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWU_Kontener_IdTowarDWU_DWU_Towar_Id] FOREIGN KEY ([IdTowarDWU]) REFERENCES [zc].[DWU_Towar] ([Id])
);

