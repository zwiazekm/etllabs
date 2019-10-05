﻿CREATE TABLE [pdr].[s090] (
    [s090_id]              INT            NOT NULL,
    [code]                 VARCHAR (4)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s090_id] ASC)
);

