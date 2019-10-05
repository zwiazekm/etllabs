CREATE TABLE [pdr].[s058] (
    [s058_id]              INT            NOT NULL,
    [code]                 VARCHAR (10)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s058__version___01A9287E] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s058__A609464192F95AF2] PRIMARY KEY CLUSTERED ([s058_id] ASC) ON [FG_PDR]
);

