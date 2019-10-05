CREATE TABLE [aimp2].[ICS_DSK_OSOB_PODP_DOK] (
    [ID]                     NUMERIC (19)  NOT NULL,
    [EMAIL]                  NVARCHAR (70) NULL,
    [IMIE]                   NVARCHAR (30) NULL,
    [NAZWISKO]               NVARCHAR (40) NULL,
    [SWIAD_ODP_KARNEJ]       NTEXT         NULL,
    [TELEFON]                NVARCHAR (15) NULL,
    [AGENT_CELNY_DATA_WPISU] DATETIME2 (3) NULL,
    [AGENT_CELNY_NR_WPISU]   NVARCHAR (35) NULL,
    [ICS_DSK_ID]             NUMERIC (19)  NULL,
    [POUCZENIE]              NTEXT         NULL,
    [version]                INT           NULL,
    CONSTRAINT [AIS_ZCP_NATURAL_PERS_ADD_INFO_PK] PRIMARY KEY CLUSTERED ([ID] ASC)
);

