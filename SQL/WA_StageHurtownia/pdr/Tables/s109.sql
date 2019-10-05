CREATE TABLE [pdr].[s109] (
    [s109_id]              INT          NOT NULL,
    [code]                 VARCHAR (10) NOT NULL,
    [creation_tm]          DATETIME     NULL,
    [description]          NTEXT        NULL,
    [description_eng]      NTEXT        NULL,
    [last_modification_tm] DATETIME     NULL,
    [valid_from]           DATE         NULL,
    [valid_to]             DATE         NULL,
    [version_]             BIGINT       CONSTRAINT [DF__s109__version___67E9567B] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s109__1767BA7CE73CB8DE] PRIMARY KEY CLUSTERED ([s109_id] ASC)
);

