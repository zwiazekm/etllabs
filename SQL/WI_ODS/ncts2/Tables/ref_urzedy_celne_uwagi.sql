CREATE TABLE [ncts2].[ref_urzedy_celne_uwagi] (
    [id]             BIGINT       NOT NULL,
    [urzad_celny_id] BIGINT       NULL,
    [kod_uwagi]      NVARCHAR (6) NULL,
    CONSTRAINT [ref_urzedy_celne_uwagi_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ref_urzedy_celne_uwagi_urzad_celny_id_id_fk] FOREIGN KEY ([urzad_celny_id]) REFERENCES [ncts2].[ref_urzedy_celne] ([id])
);

