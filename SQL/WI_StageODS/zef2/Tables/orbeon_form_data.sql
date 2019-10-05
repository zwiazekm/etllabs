CREATE TABLE [zef2].[orbeon_form_data] (
    [id1]                   INT           NOT NULL,
    [app]                   VARCHAR (256) NULL,
    [created]               DATETIME2 (7) NULL,
    [deleted]               VARCHAR (1)   NULL,
    [document_id]           VARCHAR (256) NULL,
    [form]                  VARCHAR (256) NULL,
    [last_modified]         DATETIME2 (7) NULL,
    [searchAppName]         VARCHAR (255) NULL,
    [searchFormDescription] VARCHAR (255) NULL,
    [searchFormName]        VARCHAR (255) NULL,
    [searchFormTitle]       VARCHAR (255) NULL,
    [taskCompleted]         BIT           NULL,
    [taskId]                BIGINT        NULL,
    [username]              VARCHAR (256) NULL,
    [xml]                   VARCHAR (MAX) NULL,
    [pUid]                  VARCHAR (255) NULL,
    [uid]                   VARCHAR (255) NULL,
    [migration]             BIT           NULL,
    [operacja]              NVARCHAR (1)  NULL,
    PRIMARY KEY CLUSTERED ([id1] ASC) WITH (FILLFACTOR = 70)
);

