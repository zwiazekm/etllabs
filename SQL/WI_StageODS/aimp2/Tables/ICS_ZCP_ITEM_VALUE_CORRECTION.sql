CREATE TABLE [aimp2].[ICS_ZCP_ITEM_VALUE_CORRECTION] (
    [ID]                     NUMERIC (19)    NOT NULL,
    [POSITION_ID]            NUMERIC (2)     NULL,
    [CODE]                   NVARCHAR (4)    NOT NULL,
    [VALUE]                  NUMERIC (15, 2) NULL,
    [ZCP_ITEM_VALUE_INFO_ID] NUMERIC (19)    NULL,
    [ZCP_ACF]                NTEXT           NULL,
    [version]                INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_VALUE_CORRECTION$PK_ICS_ZCP_ITEM_VALUE_CORRECTION] PRIMARY KEY CLUSTERED ([ID] ASC)
);

