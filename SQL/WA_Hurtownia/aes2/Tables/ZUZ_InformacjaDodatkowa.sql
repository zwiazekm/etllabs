CREATE TABLE [aes2].[ZUZ_InformacjaDodatkowa] (
    [Id]           NUMERIC (19)  NOT NULL,
    [KodInfDod]    NVARCHAR (5)  NULL,
    [KodInfDodPid] NVARCHAR (5)  NULL,
    [Tekst]        NVARCHAR (70) NULL,
    [IdTowarZUZ]   NUMERIC (19)  NULL,
    CONSTRAINT [ZUZ_InformacjaDodatkowa$PK_ZUZ_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_InformacjaDodatkowa_IdTowarZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdTowarZUZ]) REFERENCES [aes2].[ZUZ_Towar] ([Id])
);

