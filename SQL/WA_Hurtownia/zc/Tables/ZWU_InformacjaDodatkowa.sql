CREATE TABLE [zc].[ZWU_InformacjaDodatkowa] (
    [Id]         DECIMAL (19)  NOT NULL,
    [KodInfDod]  VARCHAR (5)   NULL,
    [Tekst]      NVARCHAR (70) NULL,
    [IdTowarZWU] DECIMAL (19)  NOT NULL,
    CONSTRAINT [PK_ZWU_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_InfDodatkowa_IdTowarZWU_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

