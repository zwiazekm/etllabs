CREATE TABLE [pdr].[s036] (
    [s036_id]              INT            NOT NULL,
    [code]                 VARCHAR (5)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (MAX) NOT NULL,
    [description_eng]      VARCHAR (350)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s036__version___2121D3D7] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s036__3C3B50EA0E5D2B06] PRIMARY KEY CLUSTERED ([s036_id] ASC) ON [FG_PDR]
);

