CREATE TABLE [zc].[ZWU_Kontener] (
    [Id]            DECIMAL (19) NOT NULL,
    [NrKontenera]   VARCHAR (17) NULL,
    [StanKontenera] CHAR (1)     NOT NULL,
    [IdTowarZWU]    DECIMAL (19) NOT NULL,
    CONSTRAINT [PK_ZWU_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_Kontener_IdTowarZWU_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

