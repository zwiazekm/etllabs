CREATE TABLE [aies].[ICS_ZCP_GUARANT] (
    [ID]                        NUMERIC (19)    NOT NULL,
    [GRN]                       VARCHAR (24)    NULL,
    [ZCP_ID]                    NUMERIC (19)    NULL,
    [ZCP_ITEM_ID]               NUMERIC (19)    NULL,
    [OTHER_GUARANTEE_TYPE_CODE] VARCHAR (35)    NULL,
    [ACCESS_CODE]               VARCHAR (4)     NULL,
    [AMOUNT]                    NUMERIC (16, 2) NULL,
    [TYPE]                      VARCHAR (1)     NULL,
    [TIN]                       VARCHAR (17)    NULL,
    CONSTRAINT [pk_ICS_ZCP_GUARANT] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

