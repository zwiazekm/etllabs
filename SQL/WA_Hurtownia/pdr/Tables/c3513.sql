CREATE TABLE [pdr].[c3513] (
    [c3513_id]             INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NOT NULL,
    [nazwa]                NVARCHAR (250) NOT NULL,
    [kodprzeznaczenia]     NVARCHAR (3)   NULL,
    PRIMARY KEY CLUSTERED ([c3513_id] ASC) ON [FG_PDR]
);

