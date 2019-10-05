CREATE TABLE [ncts2].[DokWymaganeWPT] (
    [IdTowaru]                   BIGINT        NULL,
    [KodDokWym]                  NVARCHAR (4)  NULL,
    [NrDokWym]                   NVARCHAR (35) NULL,
    [Uwagi]                      NVARCHAR (26) NULL,
    [Id]                         BIGINT        NOT NULL,
    [IdPozycji]                  INT           NULL,
    [TrybUtworzeniaPozycji]      NVARCHAR (1)  NULL,
    [IteracjaUwagRozladunkowych] SMALLINT      NULL,
    [NrJezyka]                   NVARCHAR (2)  NULL,
    [UwagiJezyk]                 NVARCHAR (2)  NULL,
    CONSTRAINT [DokWymaganeWPT_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [DokWymaganeWPT_IdTowaru_Towary_fk] FOREIGN KEY ([IdTowaru]) REFERENCES [ncts2].[Towary] ([Id])
);

