CREATE TABLE [pdr].[c3008] (
    [c3008_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [koddzialu]            VARCHAR (10)   NULL,
    [kodrozdzialu]         VARCHAR (10)   NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [nazwa]                NVARCHAR (256) NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    [zablokowane]          INT            NULL,
    PRIMARY KEY CLUSTERED ([c3008_id] ASC) ON [FG_PDR]
);

