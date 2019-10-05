CREATE TABLE [aies].[ICS_ZCP_ITEM_TARIFF_MEASURE] (
    [ID]                     NUMERIC (19) NOT NULL,
    [ZCP_ITEM_ID]            NUMERIC (19) NULL,
    [UAM_QUALIFIER]          VARCHAR (1)  NULL,
    [RECORD_NUMBER]          VARCHAR (6)  NULL,
    [GEOGRAPHICAL_AREA_CODE] VARCHAR (4)  NULL,
    [SERIES]                 VARCHAR (1)  NULL,
    [SID]                    NUMERIC (15) NULL,
    [TYPE]                   VARCHAR (3)  NULL,
    [UAM_CODE]               VARCHAR (3)  NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_TARIFF_MEASURE] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

