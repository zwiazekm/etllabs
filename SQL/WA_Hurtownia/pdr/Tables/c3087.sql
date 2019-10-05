CREATE TABLE [pdr].[c3087] (
    [c3087_id]             INT           NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [idurzedu]             VARCHAR (4)   NOT NULL,
    [last_modification_tm] DATETIME      NULL,
    [nazwaurzedu]          NVARCHAR (60) NOT NULL,
    [valid_from]           DATE          NOT NULL,
    [valid_to]             DATE          NULL,
    [version_]             BIGINT        DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c3087_id] ASC) ON [FG_PDR]
);

