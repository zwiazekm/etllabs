﻿CREATE TABLE [aies].[ICS_GAN_CUST_DATA] (
    [ID]            NUMERIC (19) NOT NULL,
    [COUNTRY]       VARCHAR (2)  NULL,
    [MRN]           VARCHAR (18) NULL,
    [GAN_ITEM_ID]   NUMERIC (19) NULL,
    [DETAIL_XML]    TEXT         NULL,
    [MODIFY_FLAG]   TINYINT      NULL,
    [ENS_ID]        NUMERIC (19) NULL,
    [FROM_303]      TINYINT      NULL,
    [REJECT_STATUS] VARCHAR (4)  NULL,
    [REJECTED]      TINYINT      NULL,
    [REJECT_REASON] VARCHAR (4)  NULL,
    [INTRO]         INT          NULL,
    CONSTRAINT [ICS_GAN_CU_9593394511] PRIMARY KEY CLUSTERED ([ID] ASC)
);

