CREATE TABLE [pdr].[s168] (
    [s168_id]              INT            NOT NULL,
    [code]                 VARCHAR (2)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (200) NULL,
    [description_eng]      VARCHAR (200)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s168_id] ASC)
);

