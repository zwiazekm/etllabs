﻿CREATE TABLE [aies].[ICS_DSK_TOWAR_WNIOSK_PRZEDL_TE] (
    [ID]                      NUMERIC (19)   NOT NULL,
    [ICS_DSK_TOWAR_ID]        NUMERIC (19)   NOT NULL,
    [NR_POZYCJI]              NUMERIC (5)    NULL,
    [STATUS]                  CHAR (4)       NULL,
    [TERMIN]                  DATETIME       NULL,
    [UZASADNIENIE]            VARCHAR (1024) NULL,
    [NR_WLASNY_LRN]           VARCHAR (35)   NULL,
    [UZASADNIENIE_ODRZUCENIA] VARCHAR (256)  NULL,
    CONSTRAINT [pk_ICS_DSK_TOWAR_WNIOSK_PRZEDL_TE] PRIMARY KEY CLUSTERED ([ID] ASC)
);

