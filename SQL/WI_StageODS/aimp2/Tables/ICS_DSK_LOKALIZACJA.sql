CREATE TABLE [aimp2].[ICS_DSK_LOKALIZACJA] (
    [ID]                           NUMERIC (19)  NOT NULL,
    [ICS_DSK_ID]                   NUMERIC (19)  NOT NULL,
    [KOD_MIEJSCA_LOKALIZACJI_TOW]  NVARCHAR (17) NULL,
    [KRAJ]                         NCHAR (2)     NULL,
    [KWALIFIKATOR_LOKALIZACJI]     NCHAR (1)     NULL,
    [OPIS_MIEJSCA_LOKALIZACJI_TOW] NVARCHAR (70) NULL,
    [TYP_LOKALIZACJI]              NCHAR (1)     NULL,
    [DODATKOWY_IDENTYFIKATOR]      NVARCHAR (3)  NULL,
    [goods_location_code]          NVARCHAR (8)  NULL,
    [version]                      INT           NOT NULL,
    CONSTRAINT [ICS_DSK_LOKALIZACJA$PK_ICS_DSK_LOKALIZACJA] PRIMARY KEY CLUSTERED ([ID] ASC)
);

