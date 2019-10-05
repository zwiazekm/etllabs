CREATE TABLE [pdr].[c350234] (
    [c350234_id]           INT            NOT NULL,
    [code]                 VARCHAR (36)   NOT NULL,
    [nazwa]                NVARCHAR (255) NULL,
    [creation_tm]          DATETIME       NULL,
    [last_modification_tm] DATETIME       NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         NOT NULL,
    PRIMARY KEY CLUSTERED ([c350234_id] ASC) ON [FG_PDR]
);


GO
CREATE NONCLUSTERED INDEX [IX_c350234_code]
    ON [pdr].[c350234]([code] ASC)
    INCLUDE([valid_from], [valid_to])
    ON [FG_PDR];

