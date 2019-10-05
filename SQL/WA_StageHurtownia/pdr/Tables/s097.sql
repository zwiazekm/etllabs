CREATE TABLE [pdr].[s097] (
    [s097_id]              INT            NOT NULL,
    [code]                 VARCHAR (10)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s097__version___62307D25] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s097__5CBB990A4A63F060] PRIMARY KEY CLUSTERED ([s097_id] ASC)
);

