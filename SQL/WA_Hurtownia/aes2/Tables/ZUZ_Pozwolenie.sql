CREATE TABLE [aes2].[ZUZ_Pozwolenie] (
    [Id]                      NUMERIC (19)  NOT NULL,
    [NumerPozwolenia]         NVARCHAR (17) NULL,
    [NumerPozwoleniaWUzupeln] NVARCHAR (17) NULL,
    [IdDokZUZ]                NUMERIC (19)  NULL,
    CONSTRAINT [ZUZ_Pozwolenie$PK_ZUZ_Pozwolenie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_Pozwolenie_IdDokZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdDokZUZ]) REFERENCES [aes2].[ZUZ_Dokument] ([Id])
);

