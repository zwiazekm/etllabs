CREATE TABLE [pdr].[s097] (
    [s097_id]              INT            NOT NULL,
    [code]                 VARCHAR (10)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s097__version___6E96540A] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s097__5CBB990AFB664C17] PRIMARY KEY CLUSTERED ([s097_id] ASC) ON [FG_PDR]
);

