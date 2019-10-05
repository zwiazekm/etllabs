﻿CREATE TABLE [aimp2].[ICS_ZCP_ITEM_QUOTA] (
    [ID]                      NUMERIC (19)    NOT NULL,
    [ZCP_ITEM_ID]             NUMERIC (19)    NULL,
    [APPLIED_QUANTITY_UNIT]   NVARCHAR (3)    NULL,
    [QUALIFIER_OF_UNIT]       NVARCHAR (1)    NULL,
    [QUOTA_NO]                NVARCHAR (17)   NULL,
    [STATUS]                  NVARCHAR (4)    NULL,
    [TYPE]                    NVARCHAR (4)    NULL,
    [APPLIED_QUOTA_QUANTITY]  NUMERIC (15, 3) NULL,
    [POS_ID]                  NUMERIC (1)     NULL,
    [ZCP_ITEM_QUOTA_DEF_ID]   NUMERIC (19)    NULL,
    [VERIFICATION_STATUS]     NVARCHAR (1)    NULL,
    [sent_to_tqs]             BIT             NOT NULL,
    [VERIFICATION_STATUS_SEC] NVARCHAR (1)    NULL,
    [retro]                   BIT             NOT NULL,
    [QUOTA_GRANTED_DESCR]     NVARCHAR (45)   NULL,
    [ZCP_ACF]                 NTEXT           NULL,
    [TQ1_STATUS]              NVARCHAR (4)    NULL,
    [PREFERENCES]             NVARCHAR (3)    NULL,
    [GRANTED_QUOTA_QUANTITY]  NUMERIC (15, 3) NULL,
    [TARIFF_PROCESSED]        BIT             NOT NULL,
    [version]                 INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_QUOTA$PK_ICS_ZCP_ITEM_QUOTA] PRIMARY KEY CLUSTERED ([ID] ASC)
);

