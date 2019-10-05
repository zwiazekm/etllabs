﻿CREATE TABLE [aies].[ICS_DSK_ZABEZPIECZENIE] (
    [ID]                     NUMERIC (19)    NOT NULL,
    [ICS_DSK_ID]             NUMERIC (19)    NOT NULL,
    [GRN]                    VARCHAR (24)    NULL,
    [INNY_RODZAJ_ZABEZP_KOD] VARCHAR (35)    NULL,
    [KOD_DOSTEPU]            CHAR (4)        NULL,
    [KWOTA_ZABEZPIECZENIA]   NUMERIC (16, 2) NULL,
    [RODZAJ_ZABEZPIECZENIA]  CHAR (1)        NULL,
    [TIN]                    VARCHAR (17)    NULL,
    CONSTRAINT [pk_ICS_DSK_ZABEZPIECZENIE] PRIMARY KEY CLUSTERED ([ID] ASC)
);

