CREATE TABLE [pdr].[s553] (
    [s553_id]              INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NULL,
    [description]          NVARCHAR (160) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    PRIMARY KEY CLUSTERED ([s553_id] ASC)
);

