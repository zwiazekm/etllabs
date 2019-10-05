CREATE TABLE [pdr].[c170] (
    [c170_id]              INT            NOT NULL,
    [creation_tm]          DATETIME       NULL,
    [data]                 DATE           NOT NULL,
    [do_dnia]              VARCHAR (5)    NULL,
    [kod_urzedu]           VARCHAR (8)    NOT NULL,
    [last_modification_tm] DATETIME       NULL,
    [od_dnia]              VARCHAR (5)    NULL,
    [przyczyna]            NVARCHAR (255) NULL,
    [przyczyna_en]         VARCHAR (255)  NULL,
    [valid_from]           DATE           NULL,
    [valid_to]             DATE           NULL,
    [do_godziny]           VARCHAR (5)    NULL,
    [od_godziny]           VARCHAR (5)    NULL,
    [przyczyna_eng]        VARCHAR (255)  NULL,
    [version_]             BIGINT         DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([c170_id] ASC)
);

