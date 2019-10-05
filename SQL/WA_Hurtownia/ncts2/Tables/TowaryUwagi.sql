CREATE TABLE [ncts2].[TowaryUwagi] (
    [Id]                         BIGINT         NOT NULL,
    [IdTowaru]                   BIGINT         NULL,
    [Uwagi]                      NVARCHAR (140) NULL,
    [UwagiJezyk]                 NVARCHAR (2)   NULL,
    [TrybUtworzeniaPozycji]      NVARCHAR (1)   NULL,
    [IteracjaUwagRozladunkowych] SMALLINT       NULL,
    CONSTRAINT [TowaryUwagi_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [TowaryUwagi_IdTowaru_Towary_fk] FOREIGN KEY ([IdTowaru]) REFERENCES [ncts2].[Towary] ([Id])
);

