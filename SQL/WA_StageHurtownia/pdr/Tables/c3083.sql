CREATE TABLE [pdr].[c3083] (
    [c3083_id]              INT            NOT NULL,
    [creation_tm]           DATETIME       NULL,
    [idprzyczynazadluzenia] INT            NOT NULL,
    [last_modification_tm]  DATETIME       NULL,
    [valid_from]            DATE           NOT NULL,
    [valid_to]              DATE           NULL,
    [version_]              BIGINT         NOT NULL,
    [przyczynazadluzenia]   NVARCHAR (140) NOT NULL,
    [opis]                  NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([c3083_id] ASC)
);

