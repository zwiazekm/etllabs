CREATE TABLE [aes2].[customs_message_x] (
    [id]               NUMERIC (19)   NOT NULL,
    [doc_id]           NVARCHAR (40)  NOT NULL,
    [namespace]        NVARCHAR (255) NULL,
    [xml_name]         NVARCHAR (255) NULL,
    [self_ref]         NVARCHAR (22)  NOT NULL,
    [sender]           NVARCHAR (17)  NOT NULL,
    [recipient]        NVARCHAR (17)  NOT NULL,
    [doc_time]         DATETIME2 (3)  NULL,
    [version]          INT            NULL,
    [mime_type]        NVARCHAR (255) NOT NULL,
    [response_to_id]   NUMERIC (19)   NULL,
    [decl_id]          NUMERIC (19)   NULL,
    [attachment_to_id] NUMERIC (19)   NULL,
    [description]      NVARCHAR (210) NULL,
    [ref_no]           NVARCHAR (35)  NULL,
    [direction]        NCHAR (1)      NULL,
    CONSTRAINT [PK_customs_message_x] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2]
);

