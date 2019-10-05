﻿CREATE TABLE [aies].[ICS_DSK_WSP_ADRES] (
    [ID]           NUMERIC (19) NOT NULL,
    [KOD_POCZTOWY] VARCHAR (9)  NULL,
    [KRAJ]         CHAR (2)     NULL,
    [MIEJSCOWOSC]  VARCHAR (35) NULL,
    [ULICA_NR]     VARCHAR (70) NULL,
    CONSTRAINT [pk_ICS_DSK_WSP_ADRES] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

