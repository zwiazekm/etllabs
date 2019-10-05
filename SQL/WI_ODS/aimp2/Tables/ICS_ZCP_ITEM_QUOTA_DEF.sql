CREATE TABLE [aimp2].[ICS_ZCP_ITEM_QUOTA_DEF] (
    [ID]                       NUMERIC (19)    NOT NULL,
    [DATE_OF_UPDATE]           DATETIME2 (3)   NULL,
    [UNIT]                     NVARCHAR (3)    NULL,
    [QUALIFIER_OF_UNIT]        NVARCHAR (1)    NULL,
    [CURRENCY]                 NVARCHAR (3)    NULL,
    [ITEM_NO]                  NVARCHAR (6)    NULL,
    [BALANCE]                  NVARCHAR (9)    NULL,
    [IS_CRITICAL_STATE]        BIT             NOT NULL,
    [CRITICAL_STATE_THRESHOLD] NVARCHAR (9)    NULL,
    [INITIAL_AMOUNT]           NUMERIC (15, 3) NULL,
    [VALID_FROM]               DATETIME2 (3)   NULL,
    [VALID_TO]                 DATETIME2 (3)   NULL,
    [IS_BLOCKED]               BIT             NOT NULL,
    [BLOCKED_FROM]             DATETIME2 (3)   NULL,
    [BLOCKED_TO]               DATETIME2 (3)   NULL,
    [IS_EXHAUSED]              BIT             NOT NULL,
    [version]                  INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_QUOTA_DEF$PK_ICS_ZCP_ITEM_QUOTA_DEF] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2]
);

