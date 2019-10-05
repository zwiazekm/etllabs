CREATE TABLE [pdr].[s407] (
    [s407_id]              INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (255) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s407_id] ASC)
);

