CREATE TABLE [pdr].[c409] (
    [c409_id]              INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [kod]                  VARCHAR (5)    NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [opis]                 NVARCHAR (255) NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c409_id] ASC)
);

