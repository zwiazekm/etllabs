﻿CREATE TABLE [emcs].[EMCS_USER_TASKS] (
    [ID]                            BIGINT          NOT NULL,
    [STATUS]                        CHAR (1)        NOT NULL,
    [TASK_TYPE]                     VARCHAR (35)    NOT NULL,
    [DUE_DATE]                      DATE            NULL,
    [RESPONSIBLE_ROLE]              BIGINT          NOT NULL,
    [RESPONSIBLE_USER]              DECIMAL (10)    NULL,
    [CUSTOM_OFFICE_REFNUM]          VARCHAR (8)     NULL,
    [TITLE]                         VARCHAR (250)   NOT NULL,
    [DESCRIPTION]                   NVARCHAR (4000) NULL,
    [MVMT_ID]                       BIGINT          NULL,
    [MESSAGES_ID]                   BIGINT          NULL,
    [TRADER_IDENTIFICATION]         NVARCHAR (16)   NULL,
    [TRADER_NAME]                   NVARCHAR (182)  NULL,
    [TRADER_STREET_NAME]            NVARCHAR (65)   NULL,
    [TRADER_STREET_NUMBER]          NVARCHAR (22)   NULL,
    [TRADER_POSTCODE]               NVARCHAR (10)   NULL,
    [TRADER_CITY]                   NVARCHAR (50)   NULL,
    [USER_DESCRIPTION]              NVARCHAR (4000) NULL,
    [CUSTOMS_REJECTION_REASON_CODE] DECIMAL (1)     NULL,
    [DOCUMENT_REFERENCE_NUMBER]     VARCHAR (21)    NULL,
    [ZISAR_MESSAGE_ID]              BIGINT          NULL,
    [CONTROL_DEFAULT_DECISION]      CHAR (1)        NULL,
    [CONTROL_DECISION]              CHAR (1)        NULL,
    [REPORT_MESSAGE_ID]             BIGINT          NULL,
    [AMOUNT]                        DECIMAL (38, 2) NULL,
    [IS_OSOZ_ACTION_SUCCESSFULL]    CHAR (1)        NULL,
    [MESSAGE_WITH_ERROR_ID]         BIGINT          NULL,
    [CREATE_DATE]                   DATETIME        NOT NULL,
    [CHANGE_DATE]                   DATETIME        NULL,
    [CHANGE_DESCRIPTION]            NVARCHAR (4000) NULL,
    [CHANGED_BY]                    VARCHAR (50)    NULL,
    [AUDIT_VER]                     INT             CONSTRAINT [DF__EMCS_USER__AUDIT__2AE0483B] DEFAULT ((0)) NOT NULL,
    [MVMT_ARC]                      VARCHAR (21)    NULL,
    [MVMT_LRN]                      NVARCHAR (22)   NULL,
    [PLACE_OF_CONTROL_NAME]         NVARCHAR (182)  NULL,
    [CONTROL_REQUESTED]             CHAR (1)        NULL,
    [TRANSHIPMENT_DATE]             DATETIME        NULL,
    CONSTRAINT [PK_USER_TASKS] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (DATA_COMPRESSION = PAGE) ON [FG_EMCS],
    CONSTRAINT [AVCON_1292567136_CONTR_000] CHECK ([CONTROL_DEFAULT_DECISION]='1' OR [CONTROL_DEFAULT_DECISION]='0'),
    CONSTRAINT [AVCON_1292567136_CONTR_001] CHECK ([CONTROL_DECISION]='1' OR [CONTROL_DECISION]='0'),
    CONSTRAINT [AVCON_1292567136_IS_OS_000] CHECK ([IS_OSOZ_ACTION_SUCCESSFULL]='1' OR [IS_OSOZ_ACTION_SUCCESSFULL]='0'),
    CONSTRAINT [AVCON_1292567136_STATU_002] CHECK ([STATUS]='E' OR [STATUS]='C' OR [STATUS]='F' OR [STATUS]='A' OR [STATUS]='I'),
    CONSTRAINT [AVCON_1311084212_CONTR_001] CHECK ([CONTROL_REQUESTED]='1' OR [CONTROL_REQUESTED]='0')
);

