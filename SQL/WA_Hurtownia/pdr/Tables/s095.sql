CREATE TABLE [pdr].[s095] (
    [s095_id]              INT            NOT NULL,
    [code]                 VARCHAR (10)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s095__version___6DA22FD1] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s095__ADB85E9D4F34E9DA] PRIMARY KEY CLUSTERED ([s095_id] ASC) ON [FG_PDR]
);

