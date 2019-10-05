﻿CREATE TABLE [akc].[ZPNW_Towary] (
    [IdDok]                       VARCHAR (30)    NOT NULL,
    [NumerPozycji]                INT             NOT NULL,
    [OpisWyrobow]                 VARCHAR (255)   NULL,
    [KodCN]                       VARCHAR (15)    NULL,
    [KodCNPid]                    INT             NULL,
    [PodstawObliczPodatku]        DECIMAL (19, 6) NULL,
    [PodstawObliczPodatkuProcent] DECIMAL (19, 6) NULL,
    [StawkaPodatku]               DECIMAL (19, 2) NULL,
    [KwotaPodatku]                DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_ZPNW_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

