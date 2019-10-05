CREATE TABLE [ncts2].[ref_urzedy_celne_sezony] (
    [id]             BIGINT        NOT NULL,
    [urzad_celny_id] BIGINT        NULL,
    [kod_sezonu]     SMALLINT      NULL,
    [nazwa]          NVARCHAR (35) NULL,
    [data_od]        DATETIME      NULL,
    [data_do]        DATETIME      NULL,
    CONSTRAINT [ref_urzedy_celne_sezony_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

