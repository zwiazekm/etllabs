CREATE TABLE [ncts2].[TowaryUwagi] (
    [Id]                         BIGINT         NOT NULL,
    [IdTowaru]                   BIGINT         NULL,
    [Uwagi]                      NVARCHAR (140) NULL,
    [UwagiJezyk]                 NVARCHAR (2)   NULL,
    [TrybUtworzeniaPozycji]      NVARCHAR (1)   NULL,
    [IteracjaUwagRozladunkowych] SMALLINT       NULL,
    CONSTRAINT [TowaryUwagi_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

