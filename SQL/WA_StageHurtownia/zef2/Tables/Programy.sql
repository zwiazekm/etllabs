CREATE TABLE [zef2].[Programy] (
    [Opis]                              NVARCHAR (320) NULL,
    [NazwaProgramu]                     NVARCHAR (256) NULL,
    [KodProgramu]                       NVARCHAR (18)  NULL,
    [CzyZablokowane]                    INT            NULL,
    [WaznyOdDnia]                       DATETIME       NULL,
    [CzyWidocznyWWymiarze]              INT            NULL,
    [DataGodzOstatnModyfikacji]         DATETIME       NULL,
    [IdUzytkownikaOstatnModyfikujacego] NVARCHAR (8)   NULL,
    [IdTransakcjiModyfikacji]           BIGINT         NULL,
    [DataGodzUtworzeniaRekordu]         DATETIME       NULL,
    [IdUzytkownikaTworzacego]           NVARCHAR (8)   NULL,
    [IdTransakcjiUtworzeniaRekordu]     BIGINT         NULL,
    [WersjaRekordu]                     INT            NULL,
    [Partycja]                          BIGINT         NULL,
    [IdentyfikatorRekordu]              BIGINT         NOT NULL,
    [GrupaProgramow]                    BIGINT         NULL,
    [NazwaProgramuDlaSprawozdan]        NVARCHAR (250) NULL,
    [operacja]                          NVARCHAR (1)   NULL,
    CONSTRAINT [Programy_pk] PRIMARY KEY CLUSTERED ([IdentyfikatorRekordu] ASC),
    CONSTRAINT [CK__Programy__Identy__53433F50] CHECK ([IdentyfikatorRekordu]<>(0))
);

