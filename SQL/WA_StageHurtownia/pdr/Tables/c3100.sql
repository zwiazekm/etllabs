CREATE TABLE [pdr].[c3100] (
    [c3100_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [kod]                  NVARCHAR (30)  NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NOT NULL,
    [nazwa]                NVARCHAR (500) NOT NULL,
    [nieaktywny]           BIT            NULL,
    PRIMARY KEY CLUSTERED ([c3100_id] ASC)
);

