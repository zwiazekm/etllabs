﻿CREATE TABLE [pdr].[s049] (
    [s049_id]              INT           NOT NULL,
    [code]                 VARCHAR (2)   NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [description]          VARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140) NULL,
    [last_modification_tm] DATETIME      NULL,
    [valid_from]           DATE          NULL,
    [valid_to]             DATE          NULL,
    [version_]             BIGINT        DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s049_id] ASC) ON [FG_PDR]
);

