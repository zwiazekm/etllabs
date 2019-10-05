CREATE TABLE [pdr].[s208] (
    [s208_id]              INT            NOT NULL,
    [code]                 VARCHAR (10)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s208__version___33758E3C] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s208__9BD20D72743EEA57] PRIMARY KEY CLUSTERED ([s208_id] ASC) ON [FG_PDR]
);

