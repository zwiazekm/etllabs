CREATE TABLE [pdr].[s016] (
    [s016_id]              INT             NOT NULL,
    [code]                 VARCHAR (36)    NOT NULL,
    [creation_tm]          DATETIME        NULL,
    [description]          NVARCHAR (1024) NOT NULL,
    [description_eng]      VARCHAR (1024)  NULL,
    [last_modification_tm] DATETIME        NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [version_]             BIGINT          CONSTRAINT [DF__s016__version___15B0212B] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s016__CFA89217419C6320] PRIMARY KEY CLUSTERED ([s016_id] ASC) ON [FG_PDR]
);

