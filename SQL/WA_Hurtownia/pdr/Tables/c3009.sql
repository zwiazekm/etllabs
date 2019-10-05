CREATE TABLE [pdr].[c3009] (
    [c3009_id]             INT           NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [kodzrodla]            VARCHAR (10)  NOT NULL,
    [last_modification_tm] DATETIME      NULL,
    [nazwa]                NVARCHAR (60) NULL,
    [valid_from]           DATE          NOT NULL,
    [valid_to]             DATE          NULL,
    [version_]             BIGINT        DEFAULT ((0)) NOT NULL,
    [zablokowane]          INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([c3009_id] ASC) ON [FG_PDR]
);

