﻿CREATE TABLE [aimp2].[ICS_DSK_WSP_OSOBA_FIZYCZNA] (
    [ID]                        NUMERIC (19)  NOT NULL,
    [DSK_WSP_ADRES_ID]          NUMERIC (19)  NULL,
    [IMIE]                      NVARCHAR (30) NULL,
    [NAZWISKO]                  NVARCHAR (40) NULL,
    [NR_IDENTYFIKACYJNY]        NVARCHAR (30) NULL,
    [PESEL]                     NVARCHAR (11) NULL,
    [PLACOWKA]                  NCHAR (2)     NULL,
    [RODZAJ_PRZEDSTAWICIELSTWA] NCHAR (3)     NULL,
    [version]                   INT           NOT NULL,
    CONSTRAINT [ICS_DSK_WSP_OSOBA_FIZYCZNA$PK_ICS_DSK_WSP_OSOBA_FIZYCZNA] PRIMARY KEY CLUSTERED ([ID] ASC)
);

