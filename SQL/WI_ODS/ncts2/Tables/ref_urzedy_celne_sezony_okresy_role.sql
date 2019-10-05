CREATE TABLE [ncts2].[ref_urzedy_celne_sezony_okresy_role] (
    [id]                         BIGINT       NOT NULL,
    [urzed_celny_sezon_okres_id] BIGINT       NULL,
    [rola]                       NVARCHAR (3) NULL,
    [rodzaj_ruchu]               NVARCHAR (3) NULL,
    CONSTRAINT [ref_urzedy_celne_sezony_okresy_role_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ref_urzedy_celne_sezony_okresy_role_urzad_celny_sezon_okres_id_id_fk] FOREIGN KEY ([urzed_celny_sezon_okres_id]) REFERENCES [ncts2].[ref_urzedy_celne_sezony_okresy] ([id])
);

