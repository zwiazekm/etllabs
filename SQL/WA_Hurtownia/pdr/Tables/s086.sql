CREATE TABLE [pdr].[s086] (
    [s086_id]              INT             NOT NULL,
    [code]                 VARCHAR (5)     NOT NULL,
    [creation_tm]          DATETIME        NULL,
    [description]          NVARCHAR (4000) NOT NULL,
    [description_eng]      NVARCHAR (4000) NOT NULL,
    [last_modification_tm] DATETIME        NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [version_]             BIGINT          DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([s086_id] ASC) ON [FG_PDR]
);

