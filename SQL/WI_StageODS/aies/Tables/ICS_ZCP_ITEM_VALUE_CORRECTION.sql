CREATE TABLE [aies].[ICS_ZCP_ITEM_VALUE_CORRECTION] (
    [ID]                        NUMERIC (19)    NOT NULL,
    [ZCP_ITEM_VALUE_DETAILS_ID] NUMERIC (19)    NOT NULL,
    [POSITION_ID]               NUMERIC (2)     NULL,
    [CODE]                      VARBINARY (4)   NULL,
    [VALUE]                     NUMERIC (15, 2) NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_VALUE_CORRECTION] PRIMARY KEY CLUSTERED ([ID] ASC)
);

