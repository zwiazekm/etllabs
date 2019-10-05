CREATE TABLE [ncts2].[Opakowania] (
    [IdTowaru]                   BIGINT        NULL,
    [Rodzaj]                     NVARCHAR (3)  NULL,
    [Znaki]                      NVARCHAR (42) NULL,
    [LiczbaOpakowan]             INT           NULL,
    [IloscSztuk]                 INT           NULL,
    [Id]                         BIGINT        NOT NULL,
    [IdPozycji]                  INT           NULL,
    [TrybUtworzeniaPozycji]      NVARCHAR (1)  NULL,
    [IteracjaUwagRozladunkowych] SMALLINT      NULL,
    [ZnakiJezyk]                 NVARCHAR (2)  NULL,
    CONSTRAINT [Opakowania_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

