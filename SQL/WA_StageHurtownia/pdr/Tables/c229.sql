CREATE TABLE [pdr].[c229] (
    [c229_id]              INT            NOT NULL,
    [aktywne]              BIT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [data_wydania]         DATE           NOT NULL,
    [id_old_pdr]           VARCHAR (20)   NULL,
    [last_modification_tm] DATETIME       NULL,
    [nr]                   NVARCHAR (40)  NOT NULL,
    [urzad_wydania]        VARCHAR (8)    NOT NULL,
    [uwagi]                NVARCHAR (512) NULL,
    [valid_from]           DATE           NOT NULL,
    [valid_to]             DATE           NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c229_id] ASC)
);

