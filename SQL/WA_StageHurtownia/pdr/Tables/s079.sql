CREATE TABLE [pdr].[s079] (
    [s079_id]              INT             NOT NULL,
    [code]                 VARCHAR (1)     NOT NULL,
    [creation_tm]          DATETIME        NULL,
    [description]          NVARCHAR (1024) NOT NULL,
    [description_eng]      VARCHAR (1024)  NOT NULL,
    [last_modification_tm] DATETIME        NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [version_]             BIGINT          DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s079_id] ASC)
);

