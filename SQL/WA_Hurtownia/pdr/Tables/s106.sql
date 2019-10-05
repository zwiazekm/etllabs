CREATE TABLE [pdr].[s106] (
    [s106_id]              INT            NOT NULL,
    [code]                 VARCHAR (10)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s106__version___7266E4EE] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s106__328F9879F0E445E4] PRIMARY KEY CLUSTERED ([s106_id] ASC) ON [FG_PDR]
);

