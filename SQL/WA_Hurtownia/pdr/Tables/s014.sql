CREATE TABLE [pdr].[s014] (
    [s014_id]              INT             NOT NULL,
    [code]                 VARCHAR (3)     NOT NULL,
    [creation_tm]          DATETIME        NULL,
    [description]          NVARCHAR (1024) NOT NULL,
    [description_eng]      VARCHAR (1024)  NOT NULL,
    [last_modification_tm] DATETIME        NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [version_]             BIGINT          DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s014_id] ASC) ON [FG_PDR]
);

