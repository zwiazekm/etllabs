CREATE TABLE [pdr].[s058] (
    [s058_id]              INT            NOT NULL,
    [code]                 VARCHAR (10)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s058__version___4B4D17CD] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s058__A6094641AB042D56] PRIMARY KEY CLUSTERED ([s058_id] ASC)
);

