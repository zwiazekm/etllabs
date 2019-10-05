﻿CREATE TABLE [akc].[AKC3_ZalacznikB_Towary] (
    [IdDok]                       VARCHAR (30)    NOT NULL,
    [NumerZalacznikaSys]          INT             NOT NULL,
    [NumerPozycji]                INT             NOT NULL,
    [NazwaGrupyWyrobow]           VARCHAR (255)   NULL,
    [RodzajSymbolu]               CHAR (1)        NULL,
    [Symbol]                      VARCHAR (15)    NULL,
    [RodzajStawkiPodatAkc]        CHAR (1)        NULL,
    [PodstawObliczPodatku]        DECIMAL (19, 3) NULL,
    [PodstawObliczPodatkuProcent] DECIMAL (19, 2) NULL,
    [StawkaPodatku]               DECIMAL (19, 2) NULL,
    [StawkaPodatkuProcent]        DECIMAL (19, 2) NULL,
    [KwotaPodatku]                DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_AKC3_ZalacznikB_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC, [NumerPozycji] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKC3_ZalacznikB_Towary_IdDokNumerZalacznikaSys_AKC3_ZalacznikB_IdDokNumerZalacznikaSys] FOREIGN KEY ([IdDok], [NumerZalacznikaSys]) REFERENCES [akc].[AKC3_ZalacznikB] ([IdDok], [NumerZalacznikaSys])
);

