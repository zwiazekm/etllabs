CREATE TABLE [ncts2].[ref_urzedy_celne_sezony_okresy] (
    [id]                     BIGINT       NOT NULL,
    [urzad_celny_sezon_id]   BIGINT       NULL,
    [dzien_od]               SMALLINT     NULL,
    [dzien_do]               SMALLINT     NULL,
    [godzina_od]             NVARCHAR (4) NULL,
    [godzina_do]             NVARCHAR (4) NULL,
    [godzina_od_drugi_okres] NVARCHAR (4) NULL,
    [godzina_do_drugi_okres] NVARCHAR (4) NULL,
    CONSTRAINT [ref_urzedy_celne_sezony_okresy_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ref_urzedy_celne_sezony_okresy_urzad_celny_sezon_id_id_fk] FOREIGN KEY ([urzad_celny_sezon_id]) REFERENCES [ncts2].[ref_urzedy_celne_sezony] ([id])
);

