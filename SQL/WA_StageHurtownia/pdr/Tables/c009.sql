CREATE TABLE [pdr].[c009] (
    [c009_id]               INT            NOT NULL,
    [code]                  VARCHAR (100)  NOT NULL,
    [creation_tm]           DATETIME       NULL,
    [last_modification_tm]  DATETIME       NULL,
    [model]                 NVARCHAR (255) NULL,
    [valid_from]            DATE           NULL,
    [valid_to]              DATE           NULL,
    [version_]              BIGINT         NULL,
    [dostawczylubciezarowy] VARCHAR (255)  NULL,
    [osobowy]               NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([c009_id] ASC)
);

