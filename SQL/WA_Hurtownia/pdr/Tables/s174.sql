CREATE TABLE [pdr].[s174] (
    [s174_id]              INT            NOT NULL,
    [code]                 VARCHAR (4)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (400) NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s174_id] ASC) ON [FG_PDR]
);

