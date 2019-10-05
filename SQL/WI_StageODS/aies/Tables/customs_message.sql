CREATE TABLE [aies].[customs_message] (
    [id]               NUMERIC (19)  NOT NULL,
    [doc_id]           VARCHAR (40)  NOT NULL,
    [namespace]        VARCHAR (255) NULL,
    [xml_name]         VARCHAR (255) NULL,
    [self_ref]         VARCHAR (25)  NOT NULL,
    [sender]           VARCHAR (17)  NOT NULL,
    [recipient]        VARCHAR (17)  NOT NULL,
    [doc_time]         DATETIME      NULL,
    [version]          INT           NULL,
    [mime_type]        VARCHAR (255) NOT NULL,
    [response_to_id]   NUMERIC (19)  NULL,
    [decl_id]          NUMERIC (19)  NULL,
    [attachment_to_id] NUMERIC (19)  NULL,
    [description]      NVARCHAR (70) NULL,
    [ref_no]           VARCHAR (35)  NULL,
    [direction]        CHAR (1)      NULL,
    [doc_time_diff_mi] INT           NULL,
    [doc_time_diff_dd] INT           NULL,
    CONSTRAINT [pk_customs_message] PRIMARY KEY CLUSTERED ([id] ASC)
);

