﻿CREATE TABLE [zc].[SAD_UrzadKontrolny] (
    [IdDok]              BIGINT       NOT NULL,
    [UCZgloszenia]       VARCHAR (8)  NULL,
    [UCZgloszeniaPid]    INT          NULL,
    [KodUrzedu]          VARCHAR (8)  NULL,
    [KodUrzeduPid]       INT          NULL,
    [Nazwa]              VARCHAR (35) NULL,
    [Kraj]               CHAR (2)     NULL,
    [KrajPid]            INT          NULL,
    [UlicaNumer]         VARCHAR (35) NULL,
    [KodPocztowy]        VARCHAR (9)  NULL,
    [Miejscowosc]        VARCHAR (35) NULL,
    [UCGraniczny]        VARCHAR (8)  NULL,
    [UCGranicznyPid]     INT          NULL,
    [LokalizacjaMiejsce] VARCHAR (17) NULL,
    [LokalizacjaUC]      VARCHAR (8)  NULL,
    [LokalizacjaOpis]    VARCHAR (35) NULL,
    [SkladTyp]           CHAR (1)     NULL,
    [SkladTypPid]        INT          NULL,
    [SkladMiejsce]       VARCHAR (14) NULL,
    [SkladKraj]          CHAR (2)     NULL,
    [SkladKrajPid]       INT          NULL,
    [UCPrzeznaczenia]    VARCHAR (8)  NULL,
    [UCPrzeznaczeniaPid] INT          NULL,
    CONSTRAINT [PK_SAD_UrzadKontrolny] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_UrzadKontrolny_IdDok_SAD_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[SAD_Dokument] ([IdDok]),
    CONSTRAINT [FK_SAD_UrzadKontrolny_KodUrzeduPid] FOREIGN KEY ([KodUrzeduPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_SAD_UrzadKontrolny_KrajPid] FOREIGN KEY ([KrajPid]) REFERENCES [pdr].[s007] ([s007_id]),
    CONSTRAINT [FK_SAD_UrzadKontrolny_SkladKrajPid] FOREIGN KEY ([SkladKrajPid]) REFERENCES [pdr].[s007] ([s007_id]),
    CONSTRAINT [FK_SAD_UrzadKontrolny_SkladTypPid] FOREIGN KEY ([SkladTypPid]) REFERENCES [pdr].[s085] ([s085_id]),
    CONSTRAINT [FK_SAD_UrzadKontrolny_UCGranicznyPid] FOREIGN KEY ([UCGranicznyPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_SAD_UrzadKontrolny_UCPrzeznaczeniaPid] FOREIGN KEY ([UCPrzeznaczeniaPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_SAD_UrzadKontrolny_UCZgloszeniaPid] FOREIGN KEY ([UCZgloszeniaPid]) REFERENCES [pdr].[c001] ([c001_id])
);

