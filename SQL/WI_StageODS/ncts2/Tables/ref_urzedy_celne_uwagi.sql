CREATE TABLE [ncts2].[ref_urzedy_celne_uwagi] (
    [id]             BIGINT       NOT NULL,
    [urzad_celny_id] BIGINT       NULL,
    [kod_uwagi]      NVARCHAR (6) NULL,
    CONSTRAINT [ref_urzedy_celne_uwagi_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

