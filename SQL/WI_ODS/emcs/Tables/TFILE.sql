CREATE TABLE [emcs].[TFILE] (
    [ID]                   BIGINT          NOT NULL,
    [CONTENTOBJECTID]      BIGINT          NULL,
    [FILESIZEBYTES]        INT             NULL,
    [FILENAME]             VARCHAR (510)   NULL,
    [FILEEXTENSION]        VARCHAR (100)   NULL,
    [PRIMARYEDITORID]      INT             NULL,
    [CHECKSUM]             CHAR (20)       NULL,
    [CREATEDON]            DATE            NULL,
    [CREATEDBYID]          INT             NULL,
    [ORIGINPATH]           VARCHAR (2000)  NULL,
    [CONTENT]              VARBINARY (MAX) NULL,
    [COMPRESSIONALGORITHM] VARCHAR (50)    NULL,
    CONSTRAINT [PK_TFILE] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (DATA_COMPRESSION = PAGE) ON [FG_EMCS]
) TEXTIMAGE_ON [FG_EMCS];

