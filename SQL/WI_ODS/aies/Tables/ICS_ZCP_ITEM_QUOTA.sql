CREATE TABLE [aies].[ICS_ZCP_ITEM_QUOTA] (
    [ID]                     NUMERIC (19)    NOT NULL,
    [ZCP_ITEM_ID]            NUMERIC (19)    NULL,
    [APPLIED_QUANTITY_UNIT]  VARCHAR (3)     NULL,
    [QUALIFIER_OF_UNIT]      VARCHAR (1)     NULL,
    [QUOTA_NO]               VARCHAR (17)    NULL,
    [STATUS]                 VARCHAR (4)     NULL,
    [TYPE]                   VARCHAR (4)     NULL,
    [APPLIED_QUOTA_QUANTITY] NUMERIC (15, 3) NULL,
    [POS_ID]                 NUMERIC (1)     NULL,
    [ZCP_ITEM_QUOTA_DEF_ID]  NUMERIC (19)    NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_QUOTA] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

