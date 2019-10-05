﻿CREATE TABLE [emcs].[MOVEMENTS] (
    [ID]                             BIGINT          NOT NULL,
    [ARC]                            VARCHAR (21)    NOT NULL,
    [STATUS]                         VARCHAR (20)    NOT NULL,
    [SEQUENCE_NUMBER]                DECIMAL (2)     NOT NULL,
    [LRN]                            NVARCHAR (22)   NOT NULL,
    [MRN]                            VARCHAR (21)    NULL,
    [IS_PLACEOFDISPATCH_DOMESTIC]    CHAR (1)        DEFAULT ('0') NOT NULL,
    [CONSIGNOR_MSG_RECIPIENT]        VARCHAR (13)    NOT NULL,
    [CONSIGNOR_MSG_EMAIL]            VARCHAR (100)   NULL,
    [IS_PLACEOFDELIVERY_DOMESTIC]    CHAR (1)        DEFAULT ('0') NULL,
    [CONSIGNEE_MSG_RECIPIENT]        VARCHAR (13)    NULL,
    [CONSIGNEE_MSG_EMAIL]            VARCHAR (100)   NULL,
    [MOVEMENT_CODE]                  CHAR (1)        NULL,
    [NOTIFICATION_VALIDATION_DATE]   DATETIME        NULL,
    [DRAFT_VALIDATION_DATE]          DATETIME        NULL,
    [EXPORTING_VALID_DATE]           DATETIME        NULL,
    [CANCELATION_VALID_DATE]         DATETIME        NULL,
    [CHANGE_OF_DEST_VALID_DATE]      DATETIME        NULL,
    [REPORT_OF_RECEIPT_VALID_DATE]   DATETIME        NULL,
    [DATE_AND_TIME_OF_DISPATCH]      DATETIME        NOT NULL,
    [IS_TIME_OF_DISPATCH_SET]        CHAR (1)        DEFAULT ('0') NOT NULL,
    [SUBMISSION_TYPE]                CHAR (1)        NOT NULL,
    [ORIGIN_TYPE_CODE]               CHAR (1)        NOT NULL,
    [DESTINATION_TYPE_CODE]          CHAR (1)        NOT NULL,
    [JOURNEY_TIME]                   VARCHAR (3)     NOT NULL,
    [TRANSPORT_ARRANGEMENT_CODE]     CHAR (1)        NOT NULL,
    [DEFERRED_SUBMISSION_FLAG]       CHAR (1)        DEFAULT ('0') NOT NULL,
    [INVOICE_NUMBER]                 VARCHAR (35)    NOT NULL,
    [INVOICE_DATE]                   DATE            NULL,
    [CONSIGNOR_EXCISE_NUMBER]        VARCHAR (13)    NOT NULL,
    [CONSIGNOR_NAME]                 NVARCHAR (182)  NOT NULL,
    [CONSIGNOR_STREET_NAME]          NVARCHAR (65)   NOT NULL,
    [CONSIGNOR_STREET_NUMBER]        NVARCHAR (11)   NULL,
    [CONSIGNOR_POSTCODE]             NVARCHAR (10)   NOT NULL,
    [CONSIGNOR_CITY]                 NVARCHAR (50)   NOT NULL,
    [CONSIGNOR_LANG_CODE]            CHAR (2)        NOT NULL,
    [PLACEOFDISPATCH_EXCISE_NUMBER]  VARCHAR (13)    NULL,
    [PLACEOFDISPATCH_NAME]           NVARCHAR (182)  NULL,
    [PLACEOFDISPATCH_STREET_NAME]    NVARCHAR (65)   NULL,
    [PLACEOFDISPATCH_STREET_NUMBER]  NVARCHAR (11)   NULL,
    [PLACEOFDISPATCH_POSTCODE]       NVARCHAR (10)   NULL,
    [PLACEOFDISPATCH_CITY]           NVARCHAR (50)   NULL,
    [PLACEOFDISPATCH_LANG_CODE]      CHAR (2)        NULL,
    [PLACEOFDISPATCH_OFFICE_REFNUM]  VARCHAR (8)     NOT NULL,
    [PLACEOFDISPATCH_CTR_OFF_REF]    VARCHAR (8)     NULL,
    [IMPORT_CUST_OFFICE_REFNUM]      VARCHAR (8)     NULL,
    [CONSIGNEE_IDENTIFICATION]       NVARCHAR (16)   NULL,
    [CONSIGNEE_NAME]                 NVARCHAR (182)  NULL,
    [CONSIGNEE_STREET_NAME]          NVARCHAR (65)   NULL,
    [CONSIGNEE_STREET_NUMBER]        NVARCHAR (11)   NULL,
    [CONSIGNEE_POSTCODE]             NVARCHAR (10)   NULL,
    [CONSIGNEE_CITY]                 NVARCHAR (50)   NULL,
    [CONSIGNEE_LANG_CODE]            CHAR (2)        NULL,
    [COMPL_CONSIGNEE_COUNTRY_CODE]   CHAR (2)        NULL,
    [COMPL_CONSIGNEE_EXEMPTION_CERT] VARCHAR (255)   NULL,
    [WAS_CONSIGNEE_CHANGED]          CHAR (1)        DEFAULT ('0') NOT NULL,
    [PLACEOFDELIVERY_IDENTIFICATION] NVARCHAR (16)   NULL,
    [PLACEOFDELIVERY_NAME]           NVARCHAR (182)  NULL,
    [PLACEOFDELIVERY_STREET_NAME]    NVARCHAR (65)   NULL,
    [PLACEOFDELIVERY_STREET_NUMBER]  NVARCHAR (11)   NULL,
    [PLACEOFDELIVERY_POSTCODE]       NVARCHAR (10)   NULL,
    [PLACEOFDELIVERY_CITY]           NVARCHAR (50)   NULL,
    [PLACEOFDELIVERY_LANG_CODE]      CHAR (2)        NULL,
    [PLACEOFDELIVERY_OFFICE_REFNUM]  VARCHAR (8)     NULL,
    [PLACEOFDELIVERY_CTR_OFFICE_REF] VARCHAR (8)     NULL,
    [GUARANTOR_TYPE_CODE]            VARCHAR (4)     NULL,
    [GUARANTEE_REFERENCE_NUMBER]     VARCHAR (17)    NULL,
    [CONSIGNOR_TIN]                  VARCHAR (12)    NULL,
    [GUARANTOR_TIN]                  VARCHAR (12)    NULL,
    [GUARANTEE_AMOUNT]               DECIMAL (38, 2) NULL,
    [GUARANTEE_REMAINING_AMOUNT]     DECIMAL (38, 2) NULL,
    [GUARANTEE_SHORTAGE_AMOUNT]      DECIMAL (38, 2) NULL,
    [GUARANTEE_AMOUNT_MANUALLY_REL]  DECIMAL (38, 2) NULL,
    [GUARANTOR1_EXCISE_NUMBER]       VARCHAR (13)    NULL,
    [GUARANTOR1_NAME]                NVARCHAR (182)  NULL,
    [GUARANTOR1_STREET_NAME]         NVARCHAR (65)   NULL,
    [GUARANTOR1_STREET_NUMBER]       NVARCHAR (11)   NULL,
    [GUARANTOR1_POSTCODE]            NVARCHAR (10)   NULL,
    [GUARANTOR1_CITY]                NVARCHAR (50)   NULL,
    [GUARANTOR1_VAT_NUMBER]          VARCHAR (35)    NULL,
    [GUARANTOR1_LANG_CODE]           CHAR (2)        NULL,
    [GUARANTOR2_EXCISE_NUMBER]       VARCHAR (13)    NULL,
    [GUARANTOR2_NAME]                NVARCHAR (182)  NULL,
    [GUARANTOR2_STREET_NAME]         NVARCHAR (65)   NULL,
    [GUARANTOR2_STREET_NUMBER]       NVARCHAR (11)   NULL,
    [GUARANTOR2_POSTCODE]            NVARCHAR (10)   NULL,
    [GUARANTOR2_CITY]                NVARCHAR (50)   NULL,
    [GUARANTOR2_VAT_NUMBER]          VARCHAR (35)    NULL,
    [GUARANTOR2_LANG_CODE]           CHAR (2)        NULL,
    [TRANSPORT_MODE]                 CHAR (2)        NOT NULL,
    [TRANSPORT_ARRANGER_VAT_NUMBER]  VARCHAR (35)    NULL,
    [TRANSPORT_ARRANGER_NAME]        NVARCHAR (182)  NULL,
    [TRANSPORT_ARRANGER_STREET_NAME] NVARCHAR (65)   NULL,
    [TRANSPORT_ARRANGER_STREET_NUMB] NVARCHAR (11)   NULL,
    [TRANSPORT_ARRANGER_POSTCODE]    NVARCHAR (10)   NULL,
    [TRANSPORT_ARRANGER_CITY]        NVARCHAR (50)   NULL,
    [TRANSPORT_ARRANGER_LANG_CODE]   CHAR (2)        NULL,
    [FIRST_TRANSPORTER_VAT_NUMBER]   VARCHAR (35)    NULL,
    [FIRST_TRANSPORTER_NAME]         NVARCHAR (182)  NULL,
    [FIRST_TRANSPORTER_STREET_NAME]  NVARCHAR (65)   NULL,
    [FIRST_TRANSPORTER_STREET_NUMB]  NVARCHAR (11)   NULL,
    [FIRST_TRANSPORTER_POSTCODE]     NVARCHAR (10)   NULL,
    [FIRST_TRANSPORTER_CITY]         NVARCHAR (50)   NULL,
    [FIRST_TRANSPORTER_LANG_CODE]    CHAR (2)        NULL,
    [WAS_TRANSPORTER_CHANGED]        CHAR (1)        DEFAULT ('0') NOT NULL,
    [IS_PLACEOFDISPATCH_CONTROLLED]  CHAR (1)        DEFAULT ('0') NULL,
    [IS_PLACEOFDELIVERY_CONTROLLED]  CHAR (1)        DEFAULT ('0') NULL,
    [IS_DELIVERY_NOTIFIED]           CHAR (1)        NULL,
    [IS_DELAY_SIGNALLED]             CHAR (1)        DEFAULT ('0') NOT NULL,
    [IS_CONSIGNOR_EXPL_EXPECTED]     CHAR (1)        DEFAULT ('0') NOT NULL,
    [IS_CONSIGNEE_EXPL_EXPECTED]     CHAR (1)        DEFAULT ('0') NOT NULL,
    [IS_MOVEMENT_TIME_EXPIRED]       CHAR (1)        DEFAULT ('0') NOT NULL,
    [IS_AER_DISCREPANCIES_FOUND]     CHAR (1)        NULL,
    [UPSTREAM_ARC]                   VARCHAR (21)    NULL,
    [ALERT_OR_REJECTION_VALID_DATE]  DATETIME        NULL,
    [SPLITTING_VALID_DATE]           DATETIME        NULL,
    [TRANSPORT_MODE_COMPL_INFO]      NVARCHAR (350)  NULL,
    [TRANSPORT_MODE_COMPL_INFO_LANG] CHAR (2)        NULL,
    CONSTRAINT [PK_MOVEMENTS] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UK_MOVEMENTS_1] UNIQUE NONCLUSTERED ([ARC] ASC)
);

