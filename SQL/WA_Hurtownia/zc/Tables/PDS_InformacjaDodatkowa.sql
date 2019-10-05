CREATE TABLE [zc].[PDS_InformacjaDodatkowa] (
    [Id]               DECIMAL (19) NOT NULL,
    [KodInfDodatkowej] VARCHAR (5)  NULL,
    [IdTowarPDS]       DECIMAL (19) NULL,
    CONSTRAINT [PK_PDS_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PDS_InfDodatkowa_IdTowarPDS_PDS_Towar_Id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [zc].[PDS_Towar] ([Id])
);

