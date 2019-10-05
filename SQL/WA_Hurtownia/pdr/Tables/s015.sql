﻿CREATE TABLE [pdr].[s015] (
    [s015_id]              INT            NOT NULL,
    [code]                 VARCHAR (1)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (350) NOT NULL,
    [description_eng]      VARCHAR (350)  NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s015_id] ASC) ON [FG_PDR]
);

