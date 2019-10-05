CREATE TABLE [pdr].[s088] (
    [s088_id]              INT             NOT NULL,
    [code]                 VARCHAR (4)     NOT NULL,
    [creation_tm]          DATETIME        NULL,
    [description]          NVARCHAR (4000) NULL,
    [description_eng]      VARCHAR (1024)  NULL,
    [last_modification_tm] DATETIME        NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [version_]             BIGINT          DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s088_id] ASC) ON [FG_PDR]
);

