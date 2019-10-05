CREATE TABLE [pdr].[c010] (
    [c010_id]              INT          NOT NULL,
    [code]                 VARCHAR (36) NOT NULL,
    [creation_tm]          DATETIME     NULL,
    [last_modification_tm] DATETIME     NULL,
    [valid_from]           DATE         NULL,
    [valid_to]             DATE         NULL,
    [version_]             BIGINT       DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c010_id] ASC)
);

