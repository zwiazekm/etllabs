﻿CREATE TABLE [aimp2].[ICS_DSK] (
    [ID]                           NUMERIC (19)    NOT NULL,
    [DATA_PRZYJECIA]               DATETIME2 (3)   NULL,
    [DODATKOWY_EMAIL1]             NVARCHAR (70)   NULL,
    [MASA_BRUTTO]                  NUMERIC (16, 6) NULL,
    [NUMER_REFERENCYJNY_PRZESYLKI] NVARCHAR (35)   NULL,
    [PLACOWKA_PODMIOTU]            NVARCHAR (2)    NULL,
    [PODPIS_ELEKTRONICZNY]         BIT             NOT NULL,
    [STATUS]                       NVARCHAR (4)    NULL,
    [UC_DEKLARACJI]                NVARCHAR (8)    NULL,
    [OF_ODBIORCA_ID]               NUMERIC (19)    NULL,
    [PG_ODBIORCA_ID]               NUMERIC (19)    NULL,
    [OF_PODM_DO_KONTAKTU_ID]       NUMERIC (19)    NULL,
    [PG_PODM_DO_KONTAKTU_ID]       NUMERIC (19)    NULL,
    [OF_PRZEDSTAWICIEL_ID]         NUMERIC (19)    NULL,
    [PG_PRZEDSTAWICIEL_ID]         NUMERIC (19)    NULL,
    [OF_SKLAD_DEKL_ID]             NUMERIC (19)    NULL,
    [PG_SKLAD_DEKL_ID]             NUMERIC (19)    NULL,
    [REFERENCJE_DO_ZT]             BIT             NOT NULL,
    [PTW_MRZ]                      NVARCHAR (35)   NULL,
    [GAN_ID]                       NUMERIC (19)    NULL,
    [UC_NADZORU]                   NVARCHAR (8)    NULL,
    [DATA_REJESTRACJI]             DATETIME        NULL,
    [version]                      INT             NOT NULL,
    CONSTRAINT [ICS_DSK$PK_ICS_DSK] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_DSK$FK_ICS_DSK_ICS_DECL] FOREIGN KEY ([ID]) REFERENCES [aimp2].[ICS_DECL] ([ID]),
    CONSTRAINT [ICS_DSK$FK_ICS_DSK_OF_ODB_ICS_DSK_WSP_OSOBA_FIZYCZNA] FOREIGN KEY ([OF_ODBIORCA_ID]) REFERENCES [aimp2].[ICS_DSK_WSP_OSOBA_FIZYCZNA] ([ID]),
    CONSTRAINT [ICS_DSK$FK_ICS_DSK_OF_PODMK_ICS_DSK_WSP_OSOBA_FIZYCZNA] FOREIGN KEY ([OF_PODM_DO_KONTAKTU_ID]) REFERENCES [aimp2].[ICS_DSK_WSP_OSOBA_FIZYCZNA] ([ID]),
    CONSTRAINT [ICS_DSK$FK_ICS_DSK_OF_PRZ_ICS_DSK_WSP_OSOBA_FIZYCZNA] FOREIGN KEY ([OF_PRZEDSTAWICIEL_ID]) REFERENCES [aimp2].[ICS_DSK_WSP_OSOBA_FIZYCZNA] ([ID]),
    CONSTRAINT [ICS_DSK$FK_ICS_DSK_OF_SKL_ICS_DSK_WSP_OSOBA_FIZYCZNA] FOREIGN KEY ([OF_SKLAD_DEKL_ID]) REFERENCES [aimp2].[ICS_DSK_WSP_OSOBA_FIZYCZNA] ([ID]),
    CONSTRAINT [ICS_DSK$FK_ICS_DSK_PG_ODB_ICS_DSK_WSP_PODMIOT_GOSP] FOREIGN KEY ([PG_ODBIORCA_ID]) REFERENCES [aimp2].[ICS_DSK_WSP_PODMIOT_GOSP] ([ID]),
    CONSTRAINT [ICS_DSK$FK_ICS_DSK_PG_PODM_ICS_DSK_WSP_PODMIOT_GOSP] FOREIGN KEY ([PG_PODM_DO_KONTAKTU_ID]) REFERENCES [aimp2].[ICS_DSK_WSP_PODMIOT_GOSP] ([ID]),
    CONSTRAINT [ICS_DSK$FK_ICS_DSK_PG_PRZ_ICS_DSK_WSP_PODMIOT_GOSP] FOREIGN KEY ([PG_PRZEDSTAWICIEL_ID]) REFERENCES [aimp2].[ICS_DSK_WSP_PODMIOT_GOSP] ([ID]),
    CONSTRAINT [ICS_DSK$FK_ICS_DSK_PG_SKL_ICS_DSK_WSP_PODMIOT_GOSP] FOREIGN KEY ([PG_SKLAD_DEKL_ID]) REFERENCES [aimp2].[ICS_DSK_WSP_PODMIOT_GOSP] ([ID])
);


GO
ALTER TABLE [aimp2].[ICS_DSK] NOCHECK CONSTRAINT [ICS_DSK$FK_ICS_DSK_ICS_DECL];


GO
ALTER TABLE [aimp2].[ICS_DSK] NOCHECK CONSTRAINT [ICS_DSK$FK_ICS_DSK_PG_ODB_ICS_DSK_WSP_PODMIOT_GOSP];

