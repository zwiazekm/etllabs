CREATE TABLE [zef2].[DefinicjaGrupZatwierdzen] (
    [Nazwa]                             NVARCHAR (80) NULL,
    [GrupaZatwierdzen]                  NVARCHAR (10) NOT NULL,
    [StatusPoczatkowy]                  NVARCHAR (20) NULL,
    [DataGodzOstatnModyfikacji]         DATETIME      NULL,
    [IdUzytkownikaOstatnModyfikujacego] NVARCHAR (8)  NULL,
    [IdTransakcjiModyfikacji]           BIGINT        NULL,
    [DataGodzUtworzeniaRekordu]         DATETIME      NULL,
    [IdUzytkownikaTworzacego]           NVARCHAR (8)  NULL,
    [IdTransakcjiUtworzeniaRekordu]     BIGINT        NULL,
    [WersjaRekordu]                     INT           NULL,
    [Partycja]                          BIGINT        NOT NULL,
    [IdentyfikatorRekordu]              BIGINT        NULL,
    [operacja]                          NVARCHAR (1)  NULL,
    CONSTRAINT [DefinicjaGrupZatwierdzen_pk] PRIMARY KEY CLUSTERED ([Partycja] ASC, [GrupaZatwierdzen] ASC),
    CHECK ([IdentyfikatorRekordu]<>(0))
);

