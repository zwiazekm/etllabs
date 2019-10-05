CREATE TABLE [pdr].[s601] (
    [s601_id]              INT             NOT NULL,
    [code]                 VARCHAR (36)    NOT NULL,
    [creation_tm]          DATETIME        NULL,
    [last_modification_tm] DATETIME        NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [version_]             BIGINT          NOT NULL,
    [description]          NVARCHAR (2000) NOT NULL,
    [description_eng]      NVARCHAR (2000) NOT NULL,
    CONSTRAINT [PK__s601__7ADD1577DCFFE87C] PRIMARY KEY CLUSTERED ([s601_id] ASC)
);

