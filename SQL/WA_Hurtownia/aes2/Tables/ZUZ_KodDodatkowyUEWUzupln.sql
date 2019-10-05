CREATE TABLE [aes2].[ZUZ_KodDodatkowyUEWUzupln] (
    [Id]         NUMERIC (19) NOT NULL,
    [KodUE]      NVARCHAR (4) NULL,
    [KodUEPid]   NVARCHAR (4) NULL,
    [IdTowarZUZ] NUMERIC (19) NULL,
    CONSTRAINT [ZUZ_KodDodatkowyUEWUzupln$PK_ZUZ_KodDodatkowyUEWUzupln] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_KodDodatkowyUEWUzupln_IdTowarZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdTowarZUZ]) REFERENCES [aes2].[ZUZ_Towar] ([Id])
);

