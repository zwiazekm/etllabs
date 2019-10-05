﻿CREATE TABLE [ncts].[DOC_TYP] (
    [ID]               VARCHAR (6) NOT NULL,
    [COMM_DOM]         CHAR (1)    NULL,
    [SENT]             CHAR (1)    NOT NULL,
    [DAT_START]        DATETIME    NOT NULL,
    [DAT_END]          DATETIME    NULL,
    [TRANSIT_DOCUMENT] DECIMAL (1) NULL,
    CONSTRAINT [PK_DOC_TYP] PRIMARY KEY CLUSTERED ([ID] ASC)
);

