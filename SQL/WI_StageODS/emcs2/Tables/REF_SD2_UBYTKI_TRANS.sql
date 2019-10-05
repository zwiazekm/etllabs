﻿CREATE TABLE [emcs2].[REF_SD2_UBYTKI_TRANS] (
    [ID]                   NUMERIC (38)    NOT NULL,
    [REF_SD2_PODMIOTY_NRA] VARCHAR (13)    NOT NULL,
    [REF_SD2_PODMIOTY_TYP] NVARCHAR (15)   NOT NULL,
    [KOD]                  NVARCHAR (12)   NOT NULL,
    [NORMA]                NUMERIC (10, 5) NOT NULL,
    [SPOSOB_WYLICZENIA]    NVARCHAR (9)    NOT NULL,
    [OBOWIAZUJE_OD]        DATETIME2 (0)   NOT NULL,
    [OBOWIAZUJE_DO]        DATETIME2 (0)   NULL,
    CONSTRAINT [UBT_PK] PRIMARY KEY CLUSTERED ([ID] ASC)
);

