CREATE TABLE [pdr].[c3015] (
    [c3015_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [dzialanie]            NVARCHAR (15)  NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [nazwa]                NVARCHAR (256) NOT NULL,
    [podzadanie]           NVARCHAR (10)  NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    [zablokowane]          INT            NULL,
    PRIMARY KEY CLUSTERED ([c3015_id] ASC)
);

