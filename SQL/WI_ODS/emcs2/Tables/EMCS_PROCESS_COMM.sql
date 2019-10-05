CREATE TABLE [emcs2].[EMCS_PROCESS_COMM] (
    [ID]                      NUMERIC (38)    NOT NULL,
    [TYPE]                    VARCHAR (40)    NOT NULL,
    [CREATE_DATE]             DATETIME2 (6)   NOT NULL,
    [ATTEMPT_DATE]            DATETIME2 (6)   NOT NULL,
    [STATUS]                  CHAR (1)        NOT NULL,
    [FAILURE_DESCRIPTION]     VARCHAR (4000)  NULL,
    [REQUEST_ID]              NUMERIC (38)    NULL,
    [MESSAGES_ID]             NUMERIC (38)    NULL,
    [EXT_MESSAGE_ID]          VARCHAR (80)    NULL,
    [PROCESSED]               CHAR (1)        NOT NULL,
    [OFFICE_REFERENCE_NUMBER] VARCHAR (8)     NULL,
    [USER_NAME]               VARCHAR (256)   NULL,
    [WF_IS_VALID]             CHAR (1)        NULL,
    [WF_MESSAGE]              VARCHAR (500)   NULL,
    [BODY]                    VARBINARY (MAX) NULL,
    [MVMT_ID]                 NUMERIC (38)    NULL,
    CONSTRAINT [PK_EMCS_PROCESS_COMM] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_EMCS2],
    CONSTRAINT [FK_EMCS_PROCESS_COMM_3] FOREIGN KEY ([MESSAGES_ID]) REFERENCES [emcs2].[MESSAGES] ([ID]),
    CONSTRAINT [FK_EMCS_PROCESS_COMM_4] FOREIGN KEY ([MVMT_ID]) REFERENCES [emcs2].[MOVEMENTS] ([ID])
) TEXTIMAGE_ON [FG_EMCS2];

