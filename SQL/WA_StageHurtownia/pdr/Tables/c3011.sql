CREATE TABLE [pdr].[c3011] (
    [c3011_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [kodjednostki]         VARCHAR (10)   NOT NULL,
    [kodkomorki]           VARCHAR (10)   NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NOT NULL,
    [nazwa]                NVARCHAR (256) NULL,
    [zablokowane]          INT            NULL,
    PRIMARY KEY CLUSTERED ([c3011_id] ASC)
);

