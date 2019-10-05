CREATE TABLE [zef2].[DefinicjaGrupZatwierdzen] (
    [Nazwa]                             NVARCHAR (80) NOT NULL,
    [GrupaZatwierdzen]                  NVARCHAR (10) NOT NULL,
    [StatusPoczatkowy]                  NVARCHAR (20) NOT NULL,
    [DataGodzOstatnModyfikacji]         DATETIME      NOT NULL,
    [IdUzytkownikaOstatnModyfikujacego] NVARCHAR (8)  NOT NULL,
    [IdTransakcjiModyfikacji]           BIGINT        NOT NULL,
    [DataGodzUtworzeniaRekordu]         DATETIME      NOT NULL,
    [IdUzytkownikaTworzacego]           NVARCHAR (8)  NOT NULL,
    [IdTransakcjiUtworzeniaRekordu]     BIGINT        NOT NULL,
    [WersjaRekordu]                     INT           NOT NULL,
    [Partycja]                          BIGINT        NOT NULL,
    [IdentyfikatorRekordu]              BIGINT        NOT NULL,
    CONSTRAINT [DefinicjaGrupZatwierdzen_pk] PRIMARY KEY CLUSTERED ([Partycja] ASC, [GrupaZatwierdzen] ASC) ON [FG_ZEF2],
    CHECK ([IdentyfikatorRekordu]<>(0))
);

