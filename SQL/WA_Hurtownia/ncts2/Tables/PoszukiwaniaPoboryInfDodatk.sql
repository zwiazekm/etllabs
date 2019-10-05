CREATE TABLE [ncts2].[PoszukiwaniaPoboryInfDodatk] (
    [Id]                         BIGINT        NOT NULL,
    [Typ]                        NVARCHAR (5)  NULL,
    [MRN]                        NVARCHAR (18) NULL,
    [DataWyslania]               DATETIME      NULL,
    [IdKomunikatu]               BIGINT        NULL,
    [IdZapytaniaPoszukiwawczego] BIGINT        NULL,
    [DataUtworzenia]             DATETIME      NULL,
    CONSTRAINT [PoszukiwaniaPoboryInfDodatk_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [PoszukiwaniaPoboryInfDodatk_IdZapytaniaPoszukiwawczego_PoszukiwaniaPobory_fk] FOREIGN KEY ([IdZapytaniaPoszukiwawczego]) REFERENCES [ncts2].[PoszukiwaniaPobory] ([Id])
);

