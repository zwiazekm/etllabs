﻿CREATE TABLE [pdr].[s085] (
    [s085_id]              INT            NOT NULL,
    [code]                 VARCHAR (1)    NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s085_id] ASC) ON [FG_PDR]
);

