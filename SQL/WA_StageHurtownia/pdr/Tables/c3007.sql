CREATE TABLE [pdr].[c3007] (
    [c3007_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [kodprogramu]          NVARCHAR (18)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [nazwa]                NVARCHAR (256) NULL,
    [opis]                 NVARCHAR (320) NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    [zablokowane]          INT            NULL,
    PRIMARY KEY CLUSTERED ([c3007_id] ASC)
);

