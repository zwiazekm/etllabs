﻿CREATE TABLE [zef2].[RB70_Dokument] (
    [OkresSprawozdawczy]                   DATETIME       NULL,
    [NumerSprawozdania]                    NVARCHAR (30)  NULL,
    [Opis]                                 NVARCHAR (60)  NULL,
    [Zalacznik]                            NVARCHAR (30)  NULL,
    [CzyZaksiegowane]                      INT            NULL,
    [TypSprawozdania]                      INT            NULL,
    [PrzetwarzanyProfilKsiegowania]        NVARCHAR (10)  NULL,
    [Uwagi]                                NVARCHAR (MAX) NULL,
    [KodJednostki]                         BIGINT         NULL,
    [Status]                               NVARCHAR (20)  NULL,
    [GrupaZatwierdzen]                     NVARCHAR (10)  NULL,
    [CzyAgregat]                           INT            NULL,
    [CzyWyslanoDoJednNadrzed]              INT            NULL,
    [CzyZatwierdzony]                      INT            NULL,
    [SciezkaAgregacji]                     NVARCHAR (255) NULL,
    [Czesc]                                INT            NULL,
    [CzyWygenerowaneCzyWprowRecznie]       INT            NULL,
    [Poziom]                               INT            NULL,
    [PoziomDysponentaSprawozd]             INT            NULL,
    [Adresat]                              NVARCHAR (100) NULL,
    [CzyPrzyjete]                          INT            NULL,
    [CzyOdrzuconePrzezJednNadrzed]         INT            NULL,
    [IdentyfikatorSprawozdania]            BIGINT         NULL,
    [OpisWyjasnienie]                      NVARCHAR (100) NULL,
    [DataGodzOstatnModyfikacji]            DATETIME       NULL,
    [IdUzytkownikaOstatnModyfikujacego]    NVARCHAR (8)   NULL,
    [IdTransakcjiModyfikacji]              BIGINT         NULL,
    [DataGodzUtworzeniaRekordu]            DATETIME       NULL,
    [IdUzytkownikaTworzacego]              NVARCHAR (8)   NULL,
    [IdTransakcjiUtworzeniaRekordu]        BIGINT         NULL,
    [IdentyfikatorOdrzuconegoSprawozdania] BIGINT         NULL,
    [IdentyfikatorSprawozdaniaLacznego]    BIGINT         NULL,
    [WersjaRekordu]                        INT            NULL,
    [Partycja]                             BIGINT         NULL,
    [IdentyfikatorRekordu]                 BIGINT         NOT NULL,
    [DataWyslania]                         DATETIME       NULL,
    [DataGodzWygenerowania]                DATETIME       NULL,
    [DataZaksiegowania]                    DATETIME       NULL,
    [CzyWystornowano]                      INT            NULL,
    [DataStornowania]                      DATETIME       NULL,
    [WystornowanoPrzez]                    NVARCHAR (10)  NULL,
    [ZalacznikStornowania]                 NVARCHAR (30)  NULL,
    [KodProcesuTrezor]                     NVARCHAR (20)  NULL,
    [TypDefinicjiSprawozdaniaTrezor]       INT            NULL,
    [KodJednostkiTrezor]                   NVARCHAR (10)  NULL,
    [OkresBudzetowyTrezor]                 NVARCHAR (20)  NULL,
    [TrezorXML]                            NVARCHAR (MAX) NULL,
    [StatusDokumentuTrezor]                NVARCHAR (256) NULL,
    [operacja]                             NVARCHAR (1)   NULL,
    [KodGrupyDefinicji]                    BIGINT         NULL,
    CONSTRAINT [RB70_Dokument_pk] PRIMARY KEY CLUSTERED ([IdentyfikatorRekordu] ASC),
    CONSTRAINT [CK__RB70_Doku__Ident__674A37FD] CHECK ([IdentyfikatorRekordu]<>(0))
);

