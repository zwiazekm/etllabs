CREATE TABLE [pdr].[s028] (
    [s028_id]              INT            NOT NULL,
    [code]                 VARCHAR (12)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (MAX) NOT NULL,
    [description_eng]      NVARCHAR (MAX) NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s028__version___3A228BCB] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s028__7F30214B489B5EE2] PRIMARY KEY CLUSTERED ([s028_id] ASC)
);

