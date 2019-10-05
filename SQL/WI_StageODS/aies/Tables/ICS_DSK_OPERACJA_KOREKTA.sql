﻿CREATE TABLE [aies].[ICS_DSK_OPERACJA_KOREKTA] (
    [ID]                    NUMERIC (19)   NOT NULL,
    [ICS_DSK_OPERACJA_ID]   NUMERIC (19)   NOT NULL,
    [XQLPATH]               VARCHAR (255)  NULL,
    [WARTOSC_PO_KOREKCIE]   VARCHAR (1024) NULL,
    [WARTOSC_PRZED_KOREKTA] VARCHAR (1024) NULL,
    CONSTRAINT [pk_ICS_DSK_OPERACJA_KOREKTA] PRIMARY KEY CLUSTERED ([ID] ASC)
);

