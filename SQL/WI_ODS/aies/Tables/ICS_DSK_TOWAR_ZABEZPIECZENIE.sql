CREATE TABLE [aies].[ICS_DSK_TOWAR_ZABEZPIECZENIE] (
    [ID]                         NUMERIC (19)    NOT NULL,
    [ICS_DSK_TOWAR_ID]           NUMERIC (19)    NULL,
    [GRN]                        VARCHAR (24)    NULL,
    [INNY_RODZAJ_OPAKOWANIA_KOD] VARCHAR (35)    NULL,
    [KOD_DOSTEPU]                CHAR (4)        NULL,
    [KWOTA_ZABEZPIECZENIA]       NUMERIC (16, 2) NULL,
    [RODZAJ_ZABEZPIECZENIA]      CHAR (1)        NULL,
    [TIN]                        VARCHAR (17)    NULL,
    CONSTRAINT [pk_ICS_TOWAR_ZABEZPIECZENIE] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

