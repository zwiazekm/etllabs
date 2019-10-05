﻿CREATE TABLE [ais2].[ICS_ENS_ITEMS] (
    [ID]                  NUMERIC (19)    NOT NULL,
    [BALANCE_GROSS_MASS]  NUMERIC (14, 3) NULL,
    [BALANCE_PACKAGES]    INT             NULL,
    [BALN]                TINYINT         NULL,
    [CHARG_TYPE]          VARCHAR (1)     NULL,
    [CHARG_TYPE_BR]       VARCHAR (1)     NULL,
    [CHARG_TYPE_BRC]      VARCHAR (140)   NULL,
    [CODE]                VARCHAR (8)     NULL,
    [CODE_BR]             VARCHAR (8)     NULL,
    [CRN]                 NVARCHAR (70)   NULL,
    [CRN_BR]              VARCHAR (70)    NULL,
    [DANG_CODE]           VARCHAR (4)     NULL,
    [DANG_CODE_BR]        VARCHAR (4)     NULL,
    [DANG_CODE_BRC]       VARCHAR (140)   NULL,
    [ITEM_DESC]           NVARCHAR (280)  NULL,
    [ITEM_DESC_BR]        VARCHAR (280)   NULL,
    [GROSS_MASS]          NUMERIC (14, 3) NULL,
    [GROSS_MASS_BR]       NUMERIC (14, 3) NULL,
    [NUMB]                INT             NULL,
    [PLACE_OF_LOAD]       NVARCHAR (35)   NULL,
    [PLACE_OF_LOAD_BR]    VARCHAR (35)    NULL,
    [PLACE_OF_LOAD_BRC]   VARCHAR (140)   NULL,
    [PLACE_OF_UNLOAD]     NVARCHAR (35)   NULL,
    [PLACE_OF_UNLOAD_BR]  VARCHAR (35)    NULL,
    [PLACE_OF_UNLOAD_BRC] VARCHAR (140)   NULL,
    [STATE_BR]            VARCHAR (4)     NULL,
    [STATE_BRC]           VARCHAR (140)   NULL,
    [STATUS]              VARCHAR (4)     NULL,
    [ENS_ID]              NUMERIC (19)    NULL,
    [FACT_ENTRY]          VARCHAR (8)     NULL,
    [FAKE]                TINYINT         NULL,
    [INTRO]               INT             NULL,
    [REF_NO]              VARCHAR (35)    NULL,
    [REF_COMPLETED]       TINYINT         NULL,
    [HAS_DSKTOWARY]       TINYINT         NULL,
    CONSTRAINT [ICS_ENS_ITEMS$ICS_ENS_IT_5433379691] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIS2],
    CONSTRAINT [ICS_ENS_ITEMS$FK5E3D31A53A1257D6] FOREIGN KEY ([ENS_ID]) REFERENCES [ais2].[ICS_ENS] ([ID])
);

