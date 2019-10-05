﻿CREATE TABLE [tr].[KrajoweWynikiRyzykaOperacjiTranzytowej] (
    [SID]                     INT            NOT NULL,
    [SIDOperacjiTranzytowej]  INT            NOT NULL,
    [NumerWersji]             DECIMAL (3)    NOT NULL,
    [Lokalizacja]             CHAR (3)       NOT NULL,
    [WynikAnalizyRyzyka]      VARCHAR (5)    NULL,
    [DataWynikuRyzyka]        DECIMAL (8)    NULL,
    [CzasWynikuRyzyka]        DECIMAL (4)    NULL,
    [KodBledu]                VARCHAR (2)    NULL,
    [TrescBledu]              NVARCHAR (255) NULL,
    [IDProfiluKontrolujacego] VARCHAR (6)    NULL,
    [RodzdzajKontroli]        VARCHAR (1)    NULL,
    [KodInterwencji]          VARCHAR (4)    NULL,
    CONSTRAINT [PK_KrajoweWynikiRyzykaOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR]
);

