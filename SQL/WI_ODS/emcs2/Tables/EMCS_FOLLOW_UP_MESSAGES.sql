﻿CREATE TABLE [emcs2].[EMCS_FOLLOW_UP_MESSAGES] (
    [ID]                       NUMERIC (38)    NOT NULL,
    [MESSAGE_TYPE]             VARCHAR (5)     NOT NULL,
    [MESSAGE_ID]               NUMERIC (38)    NOT NULL,
    [OFFICE_REFERENCE_NUMBER]  VARCHAR (8)     NOT NULL,
    [STATUS]                   CHAR (1)        NOT NULL,
    [ARC]                      VARCHAR (21)    NOT NULL,
    [DESCRIPTION]              NVARCHAR (4000) NULL,
    [REPORT_TYPE]              CHAR (1)        NULL,
    [REPORT_NUMBER]            VARCHAR (16)    NULL,
    [CONTROL_TYPE]             VARCHAR (17)    NULL,
    [HAS_ATTACHMENTS]          CHAR (1)        NULL,
    [IS_LATEST]                CHAR (1)        NULL,
    [PARENT_ID]                NUMERIC (38)    NULL,
    [SENDER_MSA]               VARCHAR (2)     NULL,
    [RECIPIENT_MSA]            VARCHAR (2)     NULL,
    [CREATE_DATE]              DATETIME2 (6)   NOT NULL,
    [CHANGE_DATE]              DATETIME2 (6)   NOT NULL,
    [EVENT_REPORT_REFERENCE]   VARCHAR (35)    NULL,
    [CONSIGNOR_EXCISE_NUMBER]  VARCHAR (13)    NULL,
    [CONSIGNEE_IDENTIFICATION] NVARCHAR (16)   NULL,
    [FOUND_DISCREPANCIES]      CHAR (1)        NULL,
    CONSTRAINT [PK_FOLLOW_UP_MESSAGES] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_EMCS2],
    CONSTRAINT [FK_PK_FOLLOW_UP_MESSAGES_1] FOREIGN KEY ([MESSAGE_ID]) REFERENCES [emcs2].[MESSAGES] ([ID]),
    CONSTRAINT [FK_PK_FOLLOW_UP_MESSAGES_2] FOREIGN KEY ([PARENT_ID]) REFERENCES [emcs2].[EMCS_FOLLOW_UP_MESSAGES] ([ID])
);

