CREATE TABLE [ncts2].[ref_swieta_daty_lsd] (
    [id]             BIGINT        NOT NULL,
    [swieto_data_id] BIGINT        NULL,
    [kod_jezyka]     NVARCHAR (2)  NULL,
    [nazwa_swieta]   NVARCHAR (35) NULL,
    CONSTRAINT [ref_swieta_daty_lsd_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

