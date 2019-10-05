CREATE TABLE [zef2].[GrupyZatrudnienia] (
    [KodGrupyZatrudnienia]              NVARCHAR (10) NOT NULL,
    [NazwaGrupyZatrudnienia]            NVARCHAR (80) NOT NULL,
    [DataGodzOstatnModyfikacji]         DATETIME      NOT NULL,
    [IdUzytkownikaOstatnModyfikujacego] NVARCHAR (8)  NOT NULL,
    [IdTransakcjiModyfikacji]           BIGINT        NOT NULL,
    [DataGodzUtworzeniaRekordu]         DATETIME      NOT NULL,
    [IdUzytkownikaTworzacego]           NVARCHAR (8)  NOT NULL,
    [IdTransakcjiUtworzeniaRekordu]     BIGINT        NOT NULL,
    [WersjaRekordu]                     INT           NOT NULL,
    [Partycja]                          BIGINT        NOT NULL,
    [IdentyfikatorRekordu]              BIGINT        NOT NULL,
    [KodGrupyDlaSprawozdan]             NVARCHAR (10) NOT NULL,
    [CzyZablokowane]                    INT           NOT NULL,
    CONSTRAINT [GrupyZatrudnienia_pk] PRIMARY KEY CLUSTERED ([IdentyfikatorRekordu] ASC) ON [FG_ZEF2],
    CHECK ([IdentyfikatorRekordu]<>(0))
);

