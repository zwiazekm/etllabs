﻿CREATE TABLE [zef2].[RB28UE_Dokument] (
    [OkresSprawozdawczy]                   DATETIME       NOT NULL,
    [NumerSprawozdania]                    NVARCHAR (30)  NOT NULL,
    [Opis]                                 NVARCHAR (60)  NOT NULL,
    [Zalacznik]                            NVARCHAR (30)  NOT NULL,
    [CzyZaksiegowane]                      INT            NOT NULL,
    [TypSprawozdania]                      INT            NOT NULL,
    [PrzetwarzanyProfilKsiegowania]        NVARCHAR (10)  NOT NULL,
    [Uwagi]                                NVARCHAR (MAX) NULL,
    [IdentyfikatorSprawozdania]            BIGINT         NOT NULL,
    [IdentyfikatorOdrzuconegoSprawozdania] BIGINT         NOT NULL,
    [IdentyfikatorSprawozdaniaLacznego]    BIGINT         NOT NULL,
    [KodJednostki]                         BIGINT         NOT NULL,
    [Status]                               NVARCHAR (20)  NOT NULL,
    [GrupaZatwierdzen]                     NVARCHAR (10)  NOT NULL,
    [CzyAgregat]                           INT            NOT NULL,
    [CzyWyslanoDoJednNadrzed]              INT            NOT NULL,
    [CzyZatwierdzony]                      INT            NOT NULL,
    [SciezkaAgregacji]                     NVARCHAR (255) NOT NULL,
    [Czesc]                                INT            NOT NULL,
    [CzyWygenerowaneCzyWprowRecznie]       INT            NOT NULL,
    [Poziom]                               INT            NOT NULL,
    [PoziomDysponentaSprawozd]             INT            NOT NULL,
    [Adresat]                              NVARCHAR (100) NOT NULL,
    [CzyPrzyjete]                          INT            NOT NULL,
    [CzyOdrzuconePrzezJednNadrzed]         INT            NOT NULL,
    [OpisWyjasnienie]                      NVARCHAR (100) NOT NULL,
    [DataGodzOstatnModyfikacji]            DATETIME       NOT NULL,
    [IdUzytkownikaOstatnModyfikujacego]    NVARCHAR (8)   NOT NULL,
    [IdTransakcjiModyfikacji]              BIGINT         NOT NULL,
    [DataGodzUtworzeniaRekordu]            DATETIME       NOT NULL,
    [IdUzytkownikaTworzacego]              NVARCHAR (8)   NOT NULL,
    [IdTransakcjiUtworzeniaRekordu]        BIGINT         NOT NULL,
    [WersjaRekordu]                        INT            NOT NULL,
    [Partycja]                             BIGINT         NOT NULL,
    [IdentyfikatorRekordu]                 BIGINT         NOT NULL,
    [DataWyslania]                         DATETIME       NOT NULL,
    [DataGodzWygenerowania]                DATETIME       NOT NULL,
    [DataZaksiegowania]                    DATETIME       NOT NULL,
    [CzyWystornowano]                      INT            NOT NULL,
    [DataStornowania]                      DATETIME       NOT NULL,
    [WystornowanoPrzez]                    NVARCHAR (10)  NOT NULL,
    [ZalacznikStornowania]                 NVARCHAR (30)  NOT NULL,
    [KodProcesuTrezor]                     NVARCHAR (20)  NOT NULL,
    [TypDefinicjiSprawozdaniaTrezor]       INT            NOT NULL,
    [KodJednostkiTrezor]                   NVARCHAR (10)  NOT NULL,
    [OkresBudzetowyTrezor]                 NVARCHAR (20)  NOT NULL,
    [TrezorXML]                            NVARCHAR (MAX) NULL,
    [StatusDokumentuTrezor]                NVARCHAR (256) NOT NULL,
    [KodGrupyDefinicji]                    BIGINT         NOT NULL,
    CONSTRAINT [RB28UE_Dokument_pk] PRIMARY KEY CLUSTERED ([IdentyfikatorRekordu] ASC) ON [FG_ZEF2],
    CONSTRAINT [CK__RB28UE_Do__Ident__745A1A58] CHECK ([IdentyfikatorRekordu]<>(0))
) TEXTIMAGE_ON [FG_ZEF2];

