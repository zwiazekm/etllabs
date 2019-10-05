CREATE TABLE [zef2].[GrupyZatrudnienia] (
    [KodGrupyZatrudnienia]              NVARCHAR (10) NULL,
    [NazwaGrupyZatrudnienia]            NVARCHAR (80) NULL,
    [DataGodzOstatnModyfikacji]         DATETIME      NULL,
    [IdUzytkownikaOstatnModyfikujacego] NVARCHAR (8)  NULL,
    [IdTransakcjiModyfikacji]           BIGINT        NULL,
    [DataGodzUtworzeniaRekordu]         DATETIME      NULL,
    [IdUzytkownikaTworzacego]           NVARCHAR (8)  NULL,
    [IdTransakcjiUtworzeniaRekordu]     BIGINT        NULL,
    [WersjaRekordu]                     INT           NULL,
    [Partycja]                          BIGINT        NULL,
    [IdentyfikatorRekordu]              BIGINT        NOT NULL,
    [KodGrupyDlaSprawozdan]             NVARCHAR (10) NULL,
    [CzyZablokowane]                    INT           NULL,
    [operacja]                          NVARCHAR (1)  NULL,
    CONSTRAINT [GrupyZatrudnienia_pk] PRIMARY KEY CLUSTERED ([IdentyfikatorRekordu] ASC),
    CHECK ([IdentyfikatorRekordu]<>(0))
);

