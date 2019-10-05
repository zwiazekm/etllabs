CREATE TABLE [pdr].[c3022] (
    [c3022_id]             INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [kodbanderoli]         VARCHAR (10)   NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NOT NULL,
    [grupabanderol]        NVARCHAR (15)  NULL,
    [nazwabanderoli]       NVARCHAR (255) NOT NULL,
    [rodzbanderol]         VARCHAR (15)   NOT NULL,
    [typbanderol]          VARCHAR (10)   NULL,
    PRIMARY KEY CLUSTERED ([c3022_id] ASC)
);

