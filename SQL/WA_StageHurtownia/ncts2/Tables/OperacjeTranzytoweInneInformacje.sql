CREATE TABLE [ncts2].[OperacjeTranzytoweInneInformacje] (
    [Id]                         BIGINT         NOT NULL,
    [IdOperacjiTranzytowej]      BIGINT         NULL,
    [Uwagi]                      NVARCHAR (140) NULL,
    [UwagiJezyk]                 NVARCHAR (2)   NULL,
    [TrybUtworzeniaPozycji]      NVARCHAR (1)   NULL,
    [IteracjaUwagRozladunkowych] SMALLINT       NULL,
    CONSTRAINT [OperacjeTranzytoweInneInformacje_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

