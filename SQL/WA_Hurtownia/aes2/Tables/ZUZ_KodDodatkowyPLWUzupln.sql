CREATE TABLE [aes2].[ZUZ_KodDodatkowyPLWUzupln] (
    [Id]         NUMERIC (19) NOT NULL,
    [KodPL]      NVARCHAR (4) NULL,
    [KodPLPid]   NVARCHAR (4) NULL,
    [IdTowarZUZ] NUMERIC (19) NULL,
    CONSTRAINT [ZUZ_KodDodatkowyPLWUzupln$PK_ZUZ_KodDodatkowyPLWUzupln] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_KodDodatkowyPLWUzupln_IdTowarZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdTowarZUZ]) REFERENCES [aes2].[ZUZ_Towar] ([Id])
);

