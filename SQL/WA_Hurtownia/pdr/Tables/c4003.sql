CREATE TABLE [pdr].[c4003] (
    [c4003_id]             BIGINT       NOT NULL,
    [creation_tm]          DATETIME     NULL,
    [idsiscprp]            VARCHAR (17) NOT NULL,
    [last_modification_tm] DATETIME     NULL,
    [valid_from]           DATE         NULL,
    [valid_to]             DATE         NULL,
    [version_]             BIGINT       DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c4003_id] ASC) ON [FG_PDR]
);

