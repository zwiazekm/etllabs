CREATE TABLE [pdr].[c4000] (
    [c4000_id]             BIGINT       NOT NULL,
    [creation_tm]          DATETIME     NULL,
    [idsisc_rof]           VARCHAR (17) NOT NULL,
    [last_modification_tm] DATETIME     NULL,
    [valid_from]           DATE         NULL,
    [valid_to]             DATE         NULL,
    [version_]             BIGINT       DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c4000_id] ASC) ON [FG_PDR]
);

