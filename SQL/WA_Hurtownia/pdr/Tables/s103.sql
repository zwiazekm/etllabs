CREATE TABLE [pdr].[s103] (
    [s103_id]              INT            NOT NULL,
    [code]                 VARCHAR (3)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s103__version___7172C0B5] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s103__07BFC9AC0BDB96C0] PRIMARY KEY CLUSTERED ([s103_id] ASC) ON [FG_PDR]
);

