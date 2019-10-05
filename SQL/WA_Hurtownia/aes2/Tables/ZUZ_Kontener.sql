CREATE TABLE [aes2].[ZUZ_Kontener] (
    [Id]                 NUMERIC (19)  NOT NULL,
    [NrKontenera]        NVARCHAR (17) NULL,
    [NrKonteneraWUzupln] NVARCHAR (17) NULL,
    [IdTowarZUZ]         NUMERIC (19)  NULL,
    CONSTRAINT [ZUZ_Kontener$PK_ZUZ_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_Kontener_IdTowarZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdTowarZUZ]) REFERENCES [aes2].[ZUZ_Towar] ([Id])
);

