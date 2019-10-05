CREATE TABLE [pdr].[c3512] (
    [c3512_id]             INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (255) NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c3512_id] ASC) ON [FG_PDR]
);

