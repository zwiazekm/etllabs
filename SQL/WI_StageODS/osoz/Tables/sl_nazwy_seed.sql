﻿CREATE TABLE [osoz].[sl_nazwy_seed] (
    [id]               BIGINT        NOT NULL,
    [czas_modyfikacji] DATETIME      NULL,
    [aktywna]          BIT           NOT NULL,
    [kod]              VARCHAR (4)   NOT NULL,
    [nazwa]            VARCHAR (255) NOT NULL,
    [opis]             VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

