﻿CREATE TABLE [pdr].[s1517] (
    [s1517_id]             INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (140) NOT NULL,
    [description_eng]      VARCHAR (140)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s1517__version___40CF895A] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s1517__EE3D1D0835E4A2EC] PRIMARY KEY CLUSTERED ([s1517_id] ASC) ON [FG_PDR]
);

