﻿CREATE TABLE [emcs2].[EMCS_DOWN_MVMT_PROD] (
    [ID]                            NUMERIC (38)    NOT NULL,
    [RECORD_UNIQUE_REFERENCE]       FLOAT (53)      NOT NULL,
    [EXCISE_PRODUCT_CATEGORY]       VARCHAR (1)     NOT NULL,
    [EXCISE_PRODUCT_CODE]           VARCHAR (4)     NOT NULL,
    [CN_CODE]                       VARCHAR (8)     NOT NULL,
    [QUANTITY]                      NUMERIC (18, 3) NOT NULL,
    [NET_WEIGHT]                    NUMERIC (17, 2) NOT NULL,
    [ALCOHOLIC_STRENGTH]            NUMERIC (7, 2)  NULL,
    [DEGREE_PLATO]                  NUMERIC (7, 2)  NULL,
    [FISCAL_MARK]                   NVARCHAR (1050) NULL,
    [FISCAL_MARK_USED_FLAG]         CHAR (1)        NULL,
    [DESIGNATION_OF_ORIGIN]         NVARCHAR (1050) NULL,
    [SIZE_OF_PRODUCER]              VARCHAR (15)    NULL,
    [DENSITY]                       NUMERIC (7, 2)  NULL,
    [COMMERCIAL_DESCRIPTION]        NVARCHAR (1050) NULL,
    [BRAND_NAME]                    NVARCHAR (1050) NULL,
    [WINE_PRODUCT_CATEGORY]         VARCHAR (1)     NULL,
    [WINE_GROWING_ZONE_CODE]        VARCHAR (2)     NULL,
    [WINE_THIRD_COUNTRY_OF_ORIGIN]  VARCHAR (2)     NULL,
    [WINE_OTHER_INFORMATION]        NVARCHAR (1050) NULL,
    [FISCAL_MARK_LANG_CODE]         VARCHAR (2)     NULL,
    [DESIGNATION_OF_ORIG_LANG_CODE] VARCHAR (2)     NULL,
    [COMMERCIAL_DESC_LANG_CODE]     VARCHAR (2)     NULL,
    [BRAND_NAME_LANG_CODE]          VARCHAR (2)     NULL,
    [WINE_OTHER_INFO_LANG_CODE]     VARCHAR (2)     NULL,
    [DELIVERED]                     CHAR (1)        NOT NULL,
    [MVMT_ID]                       NUMERIC (38)    NOT NULL,
    CONSTRAINT [PK_DOWN_MVMT_PROD] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_EMCS2],
    CONSTRAINT [FK_DOWN_MVMT_PROD_1] FOREIGN KEY ([MVMT_ID]) REFERENCES [emcs2].[EMCS_DOWN_MOVEMENTS] ([ID])
);

