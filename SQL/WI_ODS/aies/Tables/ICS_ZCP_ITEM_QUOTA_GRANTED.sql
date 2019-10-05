CREATE TABLE [aies].[ICS_ZCP_ITEM_QUOTA_GRANTED] (
    [ID]                    NUMERIC (19)    NOT NULL,
    [ZCP_ITEM_ID]           NUMERIC (19)    NULL,
    [ISSUED_QUANTITY_UNIT]  VARCHAR (3)     NULL,
    [QUALIFIER_OF_UNIT]     VARCHAR (1)     NULL,
    [QUOTA_NO]              VARCHAR (17)    NULL,
    [ISSUED_QUOTA_QUANTITY] NUMERIC (15, 3) NULL,
    [STATUS]                VARCHAR (4)     NULL,
    [TYPE]                  VARCHAR (4)     NULL,
    [POS_ID]                NUMERIC (1)     NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_QUOTA_GRANTED] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

