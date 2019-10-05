CREATE TABLE [pdr].[c3041] (
    [c3041_id]             INT           NOT NULL,
    [creation_tm]          DATETIME      NULL,
    [idmodelu]             VARCHAR (5)   NOT NULL,
    [last_modification_tm] DATETIME      NULL,
    [marka]                NVARCHAR (22) NOT NULL,
    [model]                NVARCHAR (25) NOT NULL,
    [valid_from]           DATE          NOT NULL,
    [valid_to]             DATE          NULL,
    [version_]             BIGINT        DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([c3041_id] ASC)
);

