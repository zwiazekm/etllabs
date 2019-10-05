CREATE TABLE [emcs].[EMCS_FOLLOW_UP_MESSAGES] (
    [ID]                      BIGINT          NOT NULL,
    [MESSAGE_TYPE]            VARCHAR (5)     NOT NULL,
    [MESSAGE_ID]              BIGINT          NOT NULL,
    [OFFICE_REFERENCE_NUMBER] VARCHAR (8)     NOT NULL,
    [STATUS]                  CHAR (1)        NOT NULL,
    [ARC]                     VARCHAR (21)    NOT NULL,
    [DESCRIPTION]             NVARCHAR (4000) NULL,
    [REPORT_TYPE]             CHAR (1)        NULL,
    [REPORT_NUMBER]           VARCHAR (16)    NULL,
    [CONTROL_TYPE]            VARCHAR (17)    NULL,
    [HAS_ATTACHMENTS]         CHAR (1)        NULL,
    [IS_LATEST]               CHAR (1)        NULL,
    [PARENT_ID]               BIGINT          NULL,
    [SENDER_MSA]              CHAR (2)        NULL,
    [RECIPIENT_MSA]           CHAR (2)        NULL,
    [CREATE_DATE]             DATETIME        NOT NULL,
    [CHANGE_DATE]             DATETIME        NOT NULL,
    [EVENT_REPORT_REFERENCE]  VARCHAR (35)    NULL,
    CONSTRAINT [PK_FOLLOW_UP_MESSAGES] PRIMARY KEY CLUSTERED ([ID] ASC)
);

