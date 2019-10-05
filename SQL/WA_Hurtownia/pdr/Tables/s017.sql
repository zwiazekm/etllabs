﻿CREATE TABLE [pdr].[s017] (
    [s017_id]              INT            NOT NULL,
    [code]                 VARCHAR (1)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (350) NOT NULL,
    [description_eng]      VARCHAR (350)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s017__version___16A44564] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s017__DC5FBAF89F33B562] PRIMARY KEY CLUSTERED ([s017_id] ASC) ON [FG_PDR]
);

