CREATE TABLE [zc].[DWA_Kontener] (
    [Id]            DECIMAL (19) NOT NULL,
    [NrKontenera]   VARCHAR (17) NULL,
    [StanKontenera] CHAR (1)     NULL,
    [IdTowarDWA]    DECIMAL (19) NULL,
    CONSTRAINT [PK_DWA_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWA_Kontener_IdTowarDWA_DWA_Towar_Id] FOREIGN KEY ([IdTowarDWA]) REFERENCES [zc].[DWA_Towar] ([Id])
);

