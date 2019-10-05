CREATE TABLE [pdr].[c3068] (
    [c3068_id]                 INT            NOT NULL,
    [creation_tm]              DATETIME       NULL,
    [kodtypudochodow]          VARCHAR (30)   NOT NULL,
    [last_modification_tm]     DATETIME       NULL,
    [valid_from]               DATE           NOT NULL,
    [valid_to]                 DATE           NULL,
    [version_]                 BIGINT         NULL,
    [kodtypudochodownadrzedne] VARCHAR (30)   NULL,
    [nazwatypudochodow]        NVARCHAR (120) NULL,
    PRIMARY KEY CLUSTERED ([c3068_id] ASC) ON [FG_PDR]
);

