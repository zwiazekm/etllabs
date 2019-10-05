﻿CREATE TABLE [akc].[AKC4_ZalacznikK_Towary] (
    [IdDok]                       VARCHAR (30)    NOT NULL,
    [NumerZalacznikaSys]          INT             NOT NULL,
    [NumerPozycji]                INT             NOT NULL,
    [NazwaGrupyWyrobow]           VARCHAR (255)   NULL,
    [KodCN]                       VARCHAR (15)    NULL,
    [KodCNPid]                    INT             NULL,
    [RodzajStawkiPodatAkc]        CHAR (1)        NULL,
    [PodstawObliczPodatku]        DECIMAL (19, 3) NULL,
    [PodstawObliczPodatkuProcent] DECIMAL (19, 2) NULL,
    [StawkaPodatku]               DECIMAL (19, 2) NULL,
    [StawkaPodatkuProcent]        DECIMAL (19, 2) NULL,
    [KwotaPodatku]                DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKC4_ZalacznikK_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC, [NumerPozycji] ASC)
);

