CREATE TABLE [aies].[ICS_DSK_TOWAR_INFORMACJA] (
    [ID]                         NUMERIC (19)    NOT NULL,
    [ICS_DSK_TOWAR_ID]           NUMERIC (19)    NULL,
    [ILOSC_TOWARU]               NUMERIC (16, 6) NULL,
    [MASA_BRUTTO]                NUMERIC (16, 6) NULL,
    [MASA_NETTO]                 NUMERIC (16, 6) NULL,
    [OPIS_TOWARU]                VARCHAR (1000)  NULL,
    [UWAGI]                      VARCHAR (260)   NULL,
    [ICS_DSK_JEDNOSTKA_MIARY_ID] NUMERIC (19)    NULL,
    CONSTRAINT [pk_ICS_DSK_TOWAR_INFORMACJA] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

