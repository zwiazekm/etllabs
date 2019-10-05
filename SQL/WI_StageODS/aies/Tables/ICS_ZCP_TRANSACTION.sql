CREATE TABLE [aies].[ICS_ZCP_TRANSACTION] (
    [ID]                  NUMERIC (19)    NOT NULL,
    [ZCP_ID]              NUMERIC (19)    NULL,
    [CURRENCY]            NUMERIC (12, 5) NULL,
    [TYPE]                NUMERIC (2)     NULL,
    [CURRENCY_OF_INVOICE] VARCHAR (3)     NULL,
    CONSTRAINT [pk_ICS_ZCP_TRANSACTION] PRIMARY KEY CLUSTERED ([ID] ASC)
);

