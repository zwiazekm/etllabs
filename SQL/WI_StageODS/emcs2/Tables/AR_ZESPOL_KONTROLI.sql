﻿CREATE TABLE [emcs2].[AR_ZESPOL_KONTROLI] (
    [ID]                          NUMERIC (38)  NOT NULL,
    [OBSLUGA_WSKAZAN_KONTROLI_ID] NUMERIC (38)  NOT NULL,
    [LOGIN]                       VARCHAR (200) NOT NULL,
    [REJESTRATOR_WYNIKOW_ZISAR]   CHAR (1)      NOT NULL,
    CONSTRAINT [PK_AR_ZESPOL_KONTROLI] PRIMARY KEY CLUSTERED ([ID] ASC)
);

