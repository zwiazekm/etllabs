﻿CREATE TABLE [zc].[INNY_Historia] (
    [IdDok]          VARCHAR (30)  NOT NULL,
    [IdPozycji]      INT           NOT NULL,
    [DataZmiany]     DATETIME      NOT NULL,
    [IdJednostki]    VARCHAR (9)   NULL,
    [IdJednostkiPid] INT           NULL,
    [Operator]       VARCHAR (16)  NULL,
    [SymbolOperacji] VARCHAR (16)  NULL,
    [Adnotacja]      VARCHAR (255) NULL,
    [RodzAdnotacji]  VARCHAR (4)   NULL,
    CONSTRAINT [PK_INNY_Historia] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [DataZmiany] ASC) ON [FG_ZC],
    CONSTRAINT [FK_INNY_Historia_IdDok_INNY_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[INNY_Dokument] ([IdDok]),
    CONSTRAINT [FK_INNY_Historia_IdJednostkiPid] FOREIGN KEY ([IdJednostkiPid]) REFERENCES [pdr].[c001] ([c001_id])
);

