﻿CREATE TABLE [emcs2].[ECS_DECL_VERIFY_RESULTS] (
    [ID]                  NUMERIC (38)    NOT NULL,
    [ECSD_ID]             NUMERIC (38)    NOT NULL,
    [ITEM_NUMBER]         NUMERIC (3)     NULL,
    [ARC]                 VARCHAR (21)    NULL,
    [MVMT_PRODUCT_NUMBER] NUMERIC (3)     NULL,
    [MVMT_PRODUCT_ID]     NUMERIC (38)    NULL,
    [ERROR_CODE]          NUMERIC (2)     NOT NULL,
    [ERROR_DESCRIPTION]   NVARCHAR (1050) NULL,
    [DIAGNOSIS_CODE]      NUMERIC (1)     NULL,
    CONSTRAINT [PK_ECS_DECL_VERIFY_RESULTS] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_EMCS2],
    CONSTRAINT [FK_ECS_DECL_VERIFY_RESULTS_1] FOREIGN KEY ([ECSD_ID]) REFERENCES [emcs2].[ECS_DECLARATIONS] ([ID]),
    CONSTRAINT [FK_ECS_DECL_VERIFY_RESULTS_2] FOREIGN KEY ([MVMT_PRODUCT_ID]) REFERENCES [emcs2].[MVMT_PRODUCTS] ([ID])
);

