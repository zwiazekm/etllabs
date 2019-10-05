﻿CREATE TABLE [aies].[ICS_DSK_TOWAR_PROCEDURA] (
    [ID]                         NUMERIC (19) NOT NULL,
    [ICS_DSK_TOWAR_ID]           NUMERIC (19) NULL,
    [PROCEDURA]                  VARCHAR (17) NULL,
    [USZCZEGOLOWIENIE_PROCEDURY] CHAR (3)     NULL,
    CONSTRAINT [pk_ICS_DSK_TOWAR_PROCEDURA] PRIMARY KEY CLUSTERED ([ID] ASC)
);

