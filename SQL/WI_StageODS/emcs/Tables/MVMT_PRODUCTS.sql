﻿CREATE TABLE [emcs].[MVMT_PRODUCTS] (
    [ID]                            BIGINT          NOT NULL,
    [RECORD_UNIQUE_REFERENCE]       BIGINT          NOT NULL,
    [RECORD_UNIQUE_REFERENCE_TEXT]  VARCHAR (3)     DEFAULT ('1') NOT NULL,
    [EXCISE_PRODUCT_CATEGORY]       CHAR (1)        NOT NULL,
    [EXCISE_PRODUCT_CODE]           VARCHAR (4)     NOT NULL,
    [CN_CODE]                       VARCHAR (8)     NOT NULL,
    [QUANTITY]                      DECIMAL (18, 3) NOT NULL,
    [REMAINING_QUANTITY]            DECIMAL (18, 3) NOT NULL,
    [QUANTITY_IN_ADDITIONAL_UNIT]   DECIMAL (18, 3) NULL,
    [REMAINING_QTY_IN_ADDIT_UNIT]   DECIMAL (18, 3) NULL,
    [GROSS_WEIGHT]                  DECIMAL (17, 2) NOT NULL,
    [REMAINING_GROSS_WEIGHT]        DECIMAL (17, 2) NOT NULL,
    [NET_WEIGHT]                    DECIMAL (17, 2) NOT NULL,
    [REMAINING_NET_WEIGHT]          DECIMAL (17, 2) NOT NULL,
    [ALCOHOLIC_STRENGTH]            DECIMAL (7, 2)  NULL,
    [DEGREE_PLATO]                  DECIMAL (7, 2)  NULL,
    [FUEL_TYPE]                     CHAR (1)        NULL,
    [NOT_COLORED_AND_MARKED_OILS]   CHAR (1)        NULL,
    [BIOFUEL_CONTENT]               DECIMAL (18, 3) NULL,
    [MAX_RETAIL_PRICE]              DECIMAL (7, 2)  NULL,
    [FISCAL_MARK]                   NVARCHAR (350)  NULL,
    [FISCAL_MARK_USED_FLAG]         CHAR (1)        NULL,
    [DESIGNATION_OF_ORIGIN]         NVARCHAR (350)  NULL,
    [SIZE_OF_PRODUCER]              VARCHAR (15)    NULL,
    [DENSITY]                       DECIMAL (7, 2)  NULL,
    [COMMERCIAL_DESCRIPTION]        NVARCHAR (350)  NULL,
    [BRAND_NAME]                    NVARCHAR (350)  NULL,
    [WINE_PRODUCT_CATEGORY]         CHAR (1)        NULL,
    [WINE_GROWING_ZONE_CODE]        CHAR (2)        NULL,
    [WINE_THIRD_COUNTRY_OF_ORIGIN]  CHAR (2)        NULL,
    [WINE_OTHER_INFORMATION]        NVARCHAR (350)  NULL,
    [FISCAL_MARK_LANG_CODE]         CHAR (2)        NULL,
    [DESIGNATION_OF_ORIG_LANG_CODE] CHAR (2)        NULL,
    [COMMERCIAL_DESC_LANG_CODE]     CHAR (2)        NULL,
    [BRAND_NAME_LANG_CODE]          CHAR (2)        NULL,
    [WINE_OTHER_INFO_LANG_CODE]     CHAR (2)        NULL,
    [IS_SHORTAGE_OR_EXCESS]         CHAR (1)        NULL,
    [OBSERVED_SHORTAGE_OR_EXCESS]   DECIMAL (18, 3) NULL,
    [GUARANTEE_AMOUNT]              DECIMAL (38, 2) NULL,
    [GUARANTEE_REMAINING_AMOUNT]    DECIMAL (38, 2) NULL,
    [GUARANTEE_SHORTAGE_AMOUNT]     DECIMAL (38, 2) NULL,
    [DELIVERED]                     CHAR (1)        DEFAULT ('0') NOT NULL,
    [AER_ITEM_NUMBER]               BIGINT          NULL,
    [AER_SHORTAGE_OR_EXCESS]        DECIMAL (18, 3) NULL,
    [MVMT_ID]                       BIGINT          NOT NULL,
    [BIOFUEL_CONTENT_QUALITY]       CHAR (1)        NULL,
    CONSTRAINT [PK_MVMTPROD] PRIMARY KEY CLUSTERED ([ID] ASC)
);

