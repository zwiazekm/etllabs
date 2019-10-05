CREATE TABLE [aimp2].[ICS_ZCP_ITEM_VALUE_DETAILS] (
    [ID]                     NUMERIC (19) NOT NULL,
    [ZCP_ITEM_VALUE_INFO_ID] NUMERIC (19) NULL,
    [POSITION_ID]            NUMERIC (1)  NOT NULL,
    [CODE]                   NVARCHAR (5) NOT NULL,
    [ZCP_ACF]                NTEXT        NULL,
    [version]                INT          NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_VALUE_DETAILS$PK_ICS_ZCP_ITEM_VALUE_DETAILS] PRIMARY KEY CLUSTERED ([ID] ASC)
);

