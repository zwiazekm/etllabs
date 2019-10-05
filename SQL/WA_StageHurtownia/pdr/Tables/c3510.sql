CREATE TABLE [pdr].[c3510] (
    [c3510_id]             INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NOT NULL,
    [nazwa]                NVARCHAR (140) NOT NULL,
    PRIMARY KEY CLUSTERED ([c3510_id] ASC)
);

