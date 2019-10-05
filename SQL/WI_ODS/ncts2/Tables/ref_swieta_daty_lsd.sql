CREATE TABLE [ncts2].[ref_swieta_daty_lsd] (
    [id]             BIGINT        NOT NULL,
    [swieto_data_id] BIGINT        NULL,
    [kod_jezyka]     NVARCHAR (2)  NULL,
    [nazwa_swieta]   NVARCHAR (35) NULL,
    CONSTRAINT [ref_swieta_daty_lsd_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ref_swieta_daty_lsd_swieto_data_id_id_fk] FOREIGN KEY ([swieto_data_id]) REFERENCES [ncts2].[ref_swieta_daty] ([id])
);

