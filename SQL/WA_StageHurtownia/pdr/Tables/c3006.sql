CREATE TABLE [pdr].[c3006] (
    [c3006_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [kodparagrafu]         VARCHAR (10)   NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NULL,
    [nazwa]                NVARCHAR (256) NULL,
    [zablokowane]          INT            NULL,
    PRIMARY KEY CLUSTERED ([c3006_id] ASC)
);

