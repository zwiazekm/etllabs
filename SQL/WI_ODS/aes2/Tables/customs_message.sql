﻿CREATE TABLE [aes2].[customs_message] (
    [id]               NUMERIC (19)   NOT NULL,
    [doc_id]           NVARCHAR (40)  NOT NULL,
    [namespace]        NVARCHAR (255) NULL,
    [xml_name]         NVARCHAR (255) NULL,
    [self_ref]         NVARCHAR (25)  NOT NULL,
    [sender]           NVARCHAR (17)  NOT NULL,
    [recipient]        NVARCHAR (255) NOT NULL,
    [doc_time]         DATETIME2 (3)  NULL,
    [version]          INT            NULL,
    [mime_type]        NVARCHAR (255) NOT NULL,
    [response_to_id]   NUMERIC (19)   NULL,
    [decl_id]          NUMERIC (19)   NULL,
    [attachment_to_id] NUMERIC (19)   NULL,
    [description]      NVARCHAR (210) NULL,
    [ref_no]           NVARCHAR (35)  NULL,
    [direction]        NCHAR (1)      NULL,
    [doc_time_diff_mi] INT            NULL,
    [doc_time_diff_dd] INT            NULL,
    [app_trans_id]     NVARCHAR (50)  NULL,
    [arrive_id]        NVARCHAR (40)  NULL,
    [arrive_date]      DATETIME2 (3)  NULL,
    [unhandled]        TINYINT        NOT NULL,
    [entity_id]        NVARCHAR (50)  NULL,
    [entity_id_agent]  NVARCHAR (50)  NULL,
    [person_id_seap]   NVARCHAR (50)  NULL,
    [person_id_sisc]   NVARCHAR (50)  NULL,
    [case_id]          NVARCHAR (50)  NULL,
    [nadawca_email]    NVARCHAR (70)  NULL,
    [trad_com_system]  NVARCHAR (1)   NULL,
    CONSTRAINT [customs_message$pk_customs_message] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [customs_message$fk_message_attachment_to] FOREIGN KEY ([attachment_to_id]) REFERENCES [aes2].[customs_message] ([id]),
    CONSTRAINT [customs_message$fk_message_decl] FOREIGN KEY ([decl_id]) REFERENCES [aes2].[customs_decl] ([id]),
    CONSTRAINT [customs_message$fk_message_response_to] FOREIGN KEY ([response_to_id]) REFERENCES [aes2].[customs_message] ([id])
);


GO
ALTER TABLE [aes2].[customs_message] NOCHECK CONSTRAINT [customs_message$fk_message_attachment_to];


GO
ALTER TABLE [aes2].[customs_message] NOCHECK CONSTRAINT [customs_message$fk_message_response_to];

