CREATE TABLE [pdr].[c3502] (
    [c3502_id]             INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NOT NULL,
    [nazwa]                NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([c3502_id] ASC)
);

