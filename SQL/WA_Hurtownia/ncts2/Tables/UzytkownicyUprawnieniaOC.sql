CREATE TABLE [ncts2].[UzytkownicyUprawnieniaOC] (
    [Id]             BIGINT    NOT NULL,
    [IdUzytkownika]  BIGINT    NOT NULL,
    [TypUprawnienia] NCHAR (1) NOT NULL,
    [KodUrzedu]      NCHAR (8) NOT NULL,
    CONSTRAINT [UzytkownicyUprawnieniaOC_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2]
);

