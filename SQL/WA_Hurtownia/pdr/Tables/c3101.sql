CREATE TABLE [pdr].[c3101] (
    [c3101_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [kod]                  NVARCHAR (30)  NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [nazwa]                NVARCHAR (500) NOT NULL,
    [nieaktywny]           BIT            NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c3101_id] ASC) ON [FG_PDR]
);

