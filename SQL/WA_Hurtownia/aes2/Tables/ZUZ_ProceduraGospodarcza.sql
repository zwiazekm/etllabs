CREATE TABLE [aes2].[ZUZ_ProceduraGospodarcza] (
    [Id]                          NUMERIC (19)  NOT NULL,
    [NumerIdentyfikacyjny]        NVARCHAR (35) NULL,
    [NumerIdentyfikacyjnyWUzupln] NVARCHAR (35) NULL,
    [KodDokumentu]                NVARCHAR (6)  NULL,
    [KodDokumentuWUzupln]         NVARCHAR (6)  NULL,
    [IdTowarZUZ]                  NUMERIC (19)  NULL,
    CONSTRAINT [ZUZ_ProceduraGospodarcza$PK_ZUZ_ProceduraGospodarcza] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_ProceduraGospodarcza_IdTowarZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdTowarZUZ]) REFERENCES [aes2].[ZUZ_Towar] ([Id])
);

