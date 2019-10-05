CREATE TABLE [aes2].[ZWA_InformacjaDodatkowa] (
    [Id]              NUMERIC (19)  NOT NULL,
    [KodInfDod]       NVARCHAR (5)  NULL,
    [IdTowarZWA]      NUMERIC (19)  NULL,
    [TekstInfDod]     NVARCHAR (70) NULL,
    [KodJezykaInfDod] NVARCHAR (2)  NULL,
    CONSTRAINT [ZWA_InformacjaDodatkowa$PK_ZWA_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWA_InformacjaDodatkowa_IdTowarZWA__ZWA_Towar_id] FOREIGN KEY ([IdTowarZWA]) REFERENCES [aes2].[ZWA_Towar] ([Id])
);

