CREATE TABLE [zef2].[Programy] (
    [Opis]                              NVARCHAR (320) NOT NULL,
    [NazwaProgramu]                     NVARCHAR (256) NOT NULL,
    [KodProgramu]                       NVARCHAR (18)  NOT NULL,
    [CzyZablokowane]                    INT            NOT NULL,
    [WaznyOdDnia]                       DATETIME       NOT NULL,
    [CzyWidocznyWWymiarze]              INT            NOT NULL,
    [DataGodzOstatnModyfikacji]         DATETIME       NOT NULL,
    [IdUzytkownikaOstatnModyfikujacego] NVARCHAR (8)   NOT NULL,
    [IdTransakcjiModyfikacji]           BIGINT         NOT NULL,
    [DataGodzUtworzeniaRekordu]         DATETIME       NOT NULL,
    [IdUzytkownikaTworzacego]           NVARCHAR (8)   NOT NULL,
    [IdTransakcjiUtworzeniaRekordu]     BIGINT         NOT NULL,
    [WersjaRekordu]                     INT            NOT NULL,
    [Partycja]                          BIGINT         NOT NULL,
    [IdentyfikatorRekordu]              BIGINT         NOT NULL,
    [GrupaProgramow]                    BIGINT         NOT NULL,
    [NazwaProgramuDlaSprawozdan]        NVARCHAR (250) NOT NULL,
    CONSTRAINT [Programy_pk] PRIMARY KEY CLUSTERED ([IdentyfikatorRekordu] ASC) ON [FG_ZEF2],
    CONSTRAINT [CK__Programy__Identy__6423B28F] CHECK ([IdentyfikatorRekordu]<>(0))
);

