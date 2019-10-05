CREATE TABLE [aes2].[ZUZ_KodDodatkowyPL] (
    [Id]              NUMERIC (19) NOT NULL,
    [KodPL]           NVARCHAR (4) NULL,
    [KodPLPid]        NVARCHAR (4) NULL,
    [IdTowarZUZ]      NUMERIC (19) NULL,
    [KodPLWUzupln]    NVARCHAR (4) NULL,
    [KodPLWUzuplnPid] NVARCHAR (4) NULL,
    CONSTRAINT [ZUZ_KodDodatkowyPL$PK_ZUZ_KodDodatkowyPL] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_KodDodatkowyPL_IdTowarZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdTowarZUZ]) REFERENCES [aes2].[ZUZ_Towar] ([Id])
);

