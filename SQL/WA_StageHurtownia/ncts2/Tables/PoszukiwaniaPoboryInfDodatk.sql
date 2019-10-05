CREATE TABLE [ncts2].[PoszukiwaniaPoboryInfDodatk] (
    [Id]                         BIGINT        NOT NULL,
    [Typ]                        NVARCHAR (5)  NULL,
    [MRN]                        NVARCHAR (18) NULL,
    [DataWyslania]               DATETIME      NULL,
    [IdKomunikatu]               BIGINT        NULL,
    [IdZapytaniaPoszukiwawczego] BIGINT        NULL,
    [DataUtworzenia]             DATETIME      NULL,
    CONSTRAINT [PoszukiwaniaPoboryInfDodatk_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

