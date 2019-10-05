CREATE TABLE [pdr].[c4002] (
    [c4002_id]             BIGINT       NOT NULL,
    [creation_tm]          DATETIME     NULL,
    [idsiscp]              VARCHAR (17) NOT NULL,
    [idsiscrop]            VARCHAR (17) NOT NULL,
    [idsiscs]              VARCHAR (17) NULL,
    [last_modification_tm] DATETIME     NULL,
    [valid_from]           DATE         NULL,
    [valid_to]             DATE         NULL,
    [version_]             BIGINT       DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c4002_id] ASC) ON [FG_PDR]
);

