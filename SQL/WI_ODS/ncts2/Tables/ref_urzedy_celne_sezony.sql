CREATE TABLE [ncts2].[ref_urzedy_celne_sezony] (
    [id]             BIGINT        NOT NULL,
    [urzad_celny_id] BIGINT        NULL,
    [kod_sezonu]     SMALLINT      NULL,
    [nazwa]          NVARCHAR (35) NULL,
    [data_od]        DATETIME      NULL,
    [data_do]        DATETIME      NULL,
    CONSTRAINT [ref_urzedy_celne_sezony_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ref_urzedy_celne_sezony_urzad_celny_id_id_fk] FOREIGN KEY ([urzad_celny_id]) REFERENCES [ncts2].[ref_urzedy_celne] ([id])
);

