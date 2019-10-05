CREATE TABLE [aies].[ICS_ZCP_ITEM_QUOTA_DEF] (
    [ID]                       NUMERIC (19)    NOT NULL,
    [DATE_OF_UPDATE]           DATETIME        NULL,
    [UNIT]                     VARCHAR (3)     NULL,
    [QUALIFIER_OF_UNIT]        VARCHAR (1)     NULL,
    [CURRENCY]                 VARCHAR (3)     NULL,
    [ITEM_NO]                  VARCHAR (6)     NULL,
    [BALANCE]                  VARCHAR (9)     NULL,
    [IS_CRITICAL_STATE]        BIT             NOT NULL,
    [CRITICAL_STATE_THRESHOLD] VARCHAR (9)     NULL,
    [INITIAL_AMOUNT]           NUMERIC (15, 3) NULL,
    [VALID_FROM]               DATETIME        NULL,
    [VALID_TO]                 DATETIME        NULL,
    [IS_BLOCKED]               BIT             NOT NULL,
    [BLOCKED_FROM]             DATETIME        NULL,
    [BLOCKED_TO]               DATETIME        NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_QUOTA_DEF] PRIMARY KEY CLUSTERED ([ID] ASC)
);

