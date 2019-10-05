CREATE TABLE [pdr].[c3500] (
    [c3500_id]             INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NOT NULL,
    [nazwa]                NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([c3500_id] ASC) ON [FG_PDR]
);

