CREATE TABLE [zc].[ZWU_KodDodatkowyPL] (
    [Id]         NUMERIC (19) NOT NULL,
    [KodPL]      VARCHAR (4)  NULL,
    [IdTowarZWU] DECIMAL (19) NULL,
    CONSTRAINT [PK_ZWU_KodDodatkowyPL] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_KodDodatkowyPL_IdTowarZWU_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

