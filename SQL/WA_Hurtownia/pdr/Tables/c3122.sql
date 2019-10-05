CREATE TABLE [pdr].[c3122] (
    [c3122_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [iddokumentu]          INT            NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [nazwadok]             NVARCHAR (254) NOT NULL,
    [symbolrodz]           VARCHAR (16)   NOT NULL,
    [typdokumentu]         VARCHAR (16)   NOT NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c3122_id] ASC) ON [FG_PDR]
);

