CREATE TABLE [aimp2].[ICS_ZCP_ITEM_TARIFF_MEASURE] (
    [ID]                     NUMERIC (19)  NOT NULL,
    [ZCP_ITEM_ID]            NUMERIC (19)  NULL,
    [UAM_QUALIFIER]          NVARCHAR (1)  NULL,
    [RECORD_NUMBER]          NVARCHAR (6)  NULL,
    [GEOGRAPHICAL_AREA_CODE] NVARCHAR (4)  NULL,
    [SERIES]                 NVARCHAR (2)  NULL,
    [SID]                    NUMERIC (15)  NULL,
    [TYPE]                   NVARCHAR (3)  NULL,
    [UAM_CODE]               NVARCHAR (3)  NULL,
    [FOOTNOTES]              BIT           NOT NULL,
    [ARCHIV]                 BIT           NOT NULL,
    [REC_DATE]               DATETIME2 (3) NULL,
    [MEASURE_ID]             NVARCHAR (26) NULL,
    [RETRO_QUOTA_ID]         NUMERIC (19)  NULL,
    [version]                INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_TARIFF_MEASURE$PK_ICS_ZCP_ITEM_TARIFF_MEASURE] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_ZCP_ITEM_TARIFF_MEASURE$FK_ICS_ZCP_ITEM_TARIFF_MEASURE_ICS_ZCP_ITEM] FOREIGN KEY ([ZCP_ITEM_ID]) REFERENCES [aimp2].[ICS_ZCP_ITEM] ([ID])
);

