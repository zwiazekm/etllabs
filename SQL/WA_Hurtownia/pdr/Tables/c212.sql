CREATE TABLE [pdr].[c212] (
    [c212_id]              INT           NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [last_modification_tm] DATETIME      NULL,
    [nr]                   NVARCHAR (17) NOT NULL,
    [valid_from]           DATE          NULL,
    [valid_to]             DATE          NULL,
    [version_]             BIGINT        DEFAULT ((0)) NULL,
    [id_old_pdr]           VARCHAR (20)  NOT NULL,
    [urzad_wydania]        VARCHAR (8)   NOT NULL,
    [tin]                  VARCHAR (17)  NULL,
    PRIMARY KEY CLUSTERED ([c212_id] ASC) ON [FG_PDR]
);

