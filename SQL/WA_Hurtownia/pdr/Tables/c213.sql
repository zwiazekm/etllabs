CREATE TABLE [pdr].[c213] (
    [c213_id]               INT           NOT NULL,
    [creation_tm]           DATETIME      NULL,
    [id_old_pdr]            VARCHAR (20)  NULL,
    [kod]                   VARCHAR (6)   NOT NULL,
    [last_modification_tm]  DATETIME      NULL,
    [lp]                    BIGINT        NULL,
    [nr]                    NVARCHAR (35) NULL,
    [placowka_przedlozenia] VARCHAR (8)   NOT NULL,
    [valid_from]            DATE          NOT NULL,
    [valid_to]              DATE          NULL,
    [version_]              BIGINT        DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c213_id] ASC) ON [FG_PDR]
);

