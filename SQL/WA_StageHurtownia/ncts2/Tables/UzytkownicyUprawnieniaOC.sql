CREATE TABLE [ncts2].[UzytkownicyUprawnieniaOC] (
    [Id]             BIGINT    NOT NULL,
    [IdUzytkownika]  BIGINT    NULL,
    [TypUprawnienia] NCHAR (1) NULL,
    [KodUrzedu]      NCHAR (8) NULL,
    CONSTRAINT [UzytkownicyUprawnieniaOC_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

