﻿CREATE TABLE [aies].[ICS_ZCP_PAYMENT] (
    [ID]                     NUMERIC (19)    NOT NULL,
    [DEBT_NOTIFICATION_DATE] DATETIME        NULL,
    [DEBT_ACQUAINTED_DATE]   DATETIME        NULL,
    [AMOUNT]                 NUMERIC (16, 2) NULL,
    [AMOUNT_TO_GUARANTEE]    NUMERIC (16, 2) NULL,
    [IS_AMOUNT_GUARANTEED]   BIT             NOT NULL,
    [IS_AMOUNT_PAID]         BIT             NOT NULL,
    [PAYMENT_METHOD]         VARCHAR (1)     NULL,
    [BASE]                   NUMERIC (16, 2) NULL,
    [RATE]                   NUMERIC (17, 2) NULL,
    [TYPE]                   VARCHAR (3)     NULL,
    [ZCP_PODZ_ID]            NUMERIC (19)    NULL,
    [ZCP_DECISION_ID]        NUMERIC (19)    NULL,
    CONSTRAINT [pk_ICS_ZCP_PAYMENT] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

