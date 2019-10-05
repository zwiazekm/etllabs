﻿CREATE TABLE [zef2].[RB28UE_Pozycje] (
    [Opis]                              NVARCHAR (250)   NOT NULL,
    [NumerWiersza]                      NUMERIC (32, 16) NOT NULL,
    [PlanPoZmianach]                    NUMERIC (32, 16) NOT NULL,
    [Zaangazowanie]                     NUMERIC (32, 16) NOT NULL,
    [PlatnNarastPoczRoku]               NUMERIC (32, 16) NOT NULL,
    [ZwrotyNarastPoczRokuPlatnBiez]     NUMERIC (32, 16) NOT NULL,
    [WykonanieWydatkow]                 NUMERIC (32, 16) NOT NULL,
    [IdSprawozdania]                    BIGINT           NOT NULL,
    [Wymiar]                            BIGINT           NOT NULL,
    [Klasyfikacja]                      BIGINT           NOT NULL,
    [Dzial]                             NVARCHAR (10)    NOT NULL,
    [Rozdzial]                          NVARCHAR (10)    NOT NULL,
    [Paragraf]                          NVARCHAR (10)    NOT NULL,
    [KodProjektu]                       NVARCHAR (18)    NOT NULL,
    [IdProgramu]                        NVARCHAR (18)    NOT NULL,
    [KodGrupyZatrudnienia]              NVARCHAR (10)    NOT NULL,
    [KontoKsiegowe]                     BIGINT           NOT NULL,
    [DataGodzOstatnModyfikacji]         DATETIME         NOT NULL,
    [IdUzytkownikaOstatnModyfikujacego] NVARCHAR (8)     NOT NULL,
    [IdTransakcjiModyfikacji]           BIGINT           NOT NULL,
    [DataGodzUtworzeniaRekordu]         DATETIME         NOT NULL,
    [IdUzytkownikaTworzacego]           NVARCHAR (8)     NOT NULL,
    [IdTransakcjiUtworzeniaRekordu]     BIGINT           NOT NULL,
    [WersjaRekordu]                     INT              NOT NULL,
    [Partycja]                          BIGINT           NOT NULL,
    [IdentyfikatoRekordu]               BIGINT           NOT NULL,
    [Dzialanie]                         NVARCHAR (15)    NOT NULL,
    [Czesc]                             INT              NOT NULL,
    [NazwaProgramu]                     NVARCHAR (200)   NOT NULL,
    [NazwaOdbiorcy]                     NVARCHAR (200)   NOT NULL,
    [AdresOdbiorcy]                     NVARCHAR (250)   NOT NULL,
    [PrzyczynyDecyzjiUmorzenia]         INT              NOT NULL,
    [PowodUmorzenia]                    INT              NOT NULL,
    [KodPozycjiTrezor]                  NVARCHAR (60)    NOT NULL,
    [KodSekcjiTrezor]                   NVARCHAR (60)    NOT NULL,
    [KodWiersza]                        NVARCHAR (60)    NOT NULL,
    [Uwagi]                             NVARCHAR (150)   NOT NULL,
    CONSTRAINT [RB28UE_Pozycje_pk] PRIMARY KEY CLUSTERED ([IdentyfikatoRekordu] ASC) ON [FG_ZEF2],
    CHECK ([IdentyfikatoRekordu]<>(0))
);

