CREATE TABLE [aimp2].[ICS_MESS] (
    [ID]                      NUMERIC (19)   NOT NULL,
    [DESCRIPTION]             NVARCHAR (70)  NULL,
    [DIRECTION]               NVARCHAR (1)   NULL,
    [DOC_ID]                  NVARCHAR (40)  NOT NULL,
    [DOC_TIME]                DATETIME2 (3)  NULL,
    [MIME_TYPE]               NVARCHAR (255) NULL,
    [NAMESPACE]               NVARCHAR (255) NULL,
    [RECIPIENT]               NVARCHAR (255) NULL,
    [REF_NO]                  NVARCHAR (35)  NULL,
    [SELF_REF]                NVARCHAR (25)  NULL,
    [SENDER]                  NVARCHAR (17)  NULL,
    [VERSION]                 INT            NULL,
    [XML_NAME]                NVARCHAR (255) NULL,
    [ATTACH_ID]               NUMERIC (19)   NULL,
    [DECL_ID]                 NUMERIC (19)   NULL,
    [RESP_TO]                 NUMERIC (19)   NULL,
    [APP_TRANS_ID]            NVARCHAR (35)  NULL,
    [ARRIVE_ID]               NVARCHAR (40)  NULL,
    [ARRIVE_DATE]             DATETIME2 (3)  NULL,
    [MANUAL]                  TINYINT        NULL,
    [UNHANDLED]               TINYINT        NOT NULL,
    [entity_id]               NVARCHAR (50)  NULL,
    [entity_id_agent]         NVARCHAR (50)  NULL,
    [person_id_seap]          NVARCHAR (50)  NULL,
    [person_id_sisc]          NVARCHAR (50)  NULL,
    [case_id]                 NVARCHAR (50)  NULL,
    [nadawca_email]           NVARCHAR (70)  NULL,
    [REJECTED]                TINYINT        NULL,
    [repository]              TINYINT        NOT NULL,
    [migration_time]          DATETIME2 (3)  NULL,
    [original_doc_id]         NVARCHAR (40)  NULL,
    [trad_com_system]         NVARCHAR (1)   NULL,
    [sender_recipient_agency] NVARCHAR (20)  NULL,
    CONSTRAINT [ICS_MESS_PK] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_MESS$FKA784FFE44640C1A] FOREIGN KEY ([DECL_ID]) REFERENCES [aimp2].[ICS_DECL] ([ID]),
    CONSTRAINT [ICS_MESS$FKA784FFE6616CABC] FOREIGN KEY ([ATTACH_ID]) REFERENCES [aimp2].[ICS_MESS] ([ID]),
    CONSTRAINT [ICS_MESS$FKA784FFEC40C6EB1] FOREIGN KEY ([RESP_TO]) REFERENCES [aimp2].[ICS_MESS] ([ID])
);


GO
ALTER TABLE [aimp2].[ICS_MESS] NOCHECK CONSTRAINT [ICS_MESS$FKA784FFEC40C6EB1];

