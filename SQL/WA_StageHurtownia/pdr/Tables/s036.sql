﻿CREATE TABLE [pdr].[s036] (
    [s036_id]              INT            NOT NULL,
    [code]                 VARCHAR (5)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (MAX) NOT NULL,
    [description_eng]      VARCHAR (350)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s036__version___40CF895A] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s036__3C3B50EA04D3AD00] PRIMARY KEY CLUSTERED ([s036_id] ASC)
);

