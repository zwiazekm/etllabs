CREATE TABLE [ncts2].[ref_urzedy_celne_sezony_okresy_role] (
    [id]                         BIGINT       NOT NULL,
    [urzed_celny_sezon_okres_id] BIGINT       NULL,
    [rola]                       NVARCHAR (3) NULL,
    [rodzaj_ruchu]               NVARCHAR (3) NULL,
    CONSTRAINT [ref_urzedy_celne_sezony_okresy_role_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

