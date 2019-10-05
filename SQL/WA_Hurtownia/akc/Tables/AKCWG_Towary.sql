﻿CREATE TABLE [akc].[AKCWG_Towary] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [NumerPozycji]         INT             NOT NULL,
    [KodCN]                VARCHAR (15)    NULL,
    [NazwaGrupyWyrobow]    VARCHAR (255)   NULL,
    [PodstawObliczPodatku] DECIMAL (19, 6) NULL,
    [StawkaPodatku]        DECIMAL (19, 2) NULL,
    [KwotaPodatku]         DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_AKCWG_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKCWG_Towary_IdDok_AKCWG_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[AKCWG_Deklaracja] ([IdDok])
);

