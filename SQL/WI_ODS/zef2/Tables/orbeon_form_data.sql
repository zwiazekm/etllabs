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
    [taskCompleted]         BIT           NOT NULL,
    [taskId]                BIGINT        NULL,
    [username]              VARCHAR (256) NULL,
    [xml]                   VARCHAR (MAX) NULL,
    [pUid]                  VARCHAR (255) NULL,
    [uid]                   VARCHAR (255) NULL,
    [migration]             BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([id1] ASC) WITH (FILLFACTOR = 70) ON [FG_ZEF2]
) TEXTIMAGE_ON [FG_ZEF2];


GO
ALTER TABLE [zef2].[orbeon_form_data] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

