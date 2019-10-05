﻿CREATE TABLE [zc].[SADG_Dyrektywa] (
    [IdDok]                 VARCHAR (30)   NOT NULL,
    [AutorProfilu]          VARCHAR (40)   NULL,
    [RodzajDyrektywy]       CHAR (1)       NULL,
    [RodzajDyrektywyPid]    INT            NULL,
    [Adresat]               VARCHAR (16)   NULL,
    [Status]                CHAR (1)       NULL,
    [Tresc]                 VARCHAR (1024) NULL,
    [NrDyrektywy]           NUMERIC (5)    NOT NULL,
    [IdProfilu]             VARCHAR (40)   NULL,
    [KomentarzDyspozytora]  VARCHAR (512)  NULL,
    [KomentarzPoRealizacji] VARCHAR (512)  NULL,
    CONSTRAINT [PK_SADG_Dyrektywa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NrDyrektywy] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SADG_Dyrektywa_IdDok_SADG_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[SADG_Dokument] ([IdDok]),
    CONSTRAINT [FK_SADG_Dyrektywa_RodzajDyrektywyPid] FOREIGN KEY ([RodzajDyrektywyPid]) REFERENCES [pdr].[s100] ([s100_id])
);

