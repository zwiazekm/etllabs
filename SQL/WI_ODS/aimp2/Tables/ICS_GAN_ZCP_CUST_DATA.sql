﻿CREATE TABLE [aimp2].[ICS_GAN_ZCP_CUST_DATA] (
    [ID]                    NUMERIC (19)  NOT NULL,
    [GAN_CUST_DATA_DETL_ID] NUMERIC (19)  NOT NULL,
    [UPO_IDENT_NUMBER]      NVARCHAR (40) NOT NULL,
    [STATUS]                NVARCHAR (4)  NOT NULL,
    [ZCP_SELF_REF]          NVARCHAR (35) NULL,
    [REGI_DATE]             DATETIME2 (3) NULL,
    CONSTRAINT [ICS_GAN_ZCP_CUST_DATA_PK] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2]
);

