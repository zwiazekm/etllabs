CREATE TABLE [zc].[ZWU_KodDodatkowyUE] (
    [Id]         NUMERIC (19) NOT NULL,
    [KodUE]      VARCHAR (4)  NULL,
    [IdTowarZWU] DECIMAL (19) NULL,
    CONSTRAINT [PK_ZWU_KodDodatkowyUE] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_KodDodatkowyUE_IdTowarZWU_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

