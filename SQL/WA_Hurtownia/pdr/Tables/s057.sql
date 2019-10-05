CREATE TABLE [pdr].[s057] (
    [s057_id]              INT            NOT NULL,
    [code]                 VARCHAR (10)   NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [description]          NVARCHAR (300) NOT NULL,
    [description_eng]      VARCHAR (300)  NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         CONSTRAINT [DF__s057__version___00B50445] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__s057__BF4B54AAD0D1DAB3] PRIMARY KEY CLUSTERED ([s057_id] ASC) ON [FG_PDR]
);

