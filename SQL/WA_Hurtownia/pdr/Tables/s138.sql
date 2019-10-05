CREATE TABLE [pdr].[s138] (
    [s138_id]              INT            NOT NULL,
    [code]                 VARCHAR (3)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (350) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s138_id] ASC) ON [FG_PDR]
);

