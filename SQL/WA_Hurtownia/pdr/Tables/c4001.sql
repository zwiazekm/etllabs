CREATE TABLE [pdr].[c4001] (
    [c4001_id]             BIGINT       NOT NULL,
    [creation_tm]          DATETIME     NULL,
    [idsiscp]              VARCHAR (17) NOT NULL,
    [idsiscrof]            VARCHAR (17) NOT NULL,
    [last_modification_tm] DATETIME     NULL,
    [valid_from]           DATE         NULL,
    [valid_to]             DATE         NULL,
    [version_]             BIGINT       NULL,
    [idsiscs]              VARCHAR (17) NULL,
    PRIMARY KEY CLUSTERED ([c4001_id] ASC) ON [FG_PDR]
);

