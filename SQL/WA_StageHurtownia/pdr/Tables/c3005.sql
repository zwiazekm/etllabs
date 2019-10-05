CREATE TABLE [pdr].[c3005] (
    [c3005_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [kodprogramu]          VARCHAR (18)   NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [nazwa]                NVARCHAR (256) NOT NULL,
    [opis]                 NVARCHAR (320) NOT NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NULL,
    [zablokowane]          INT            NULL,
    PRIMARY KEY CLUSTERED ([c3005_id] ASC)
);

