﻿CREATE TABLE [pdr].[s1507] (
    [s1507_id]             INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NOT NULL,
    PRIMARY KEY CLUSTERED ([s1507_id] ASC)
);

