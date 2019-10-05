CREATE TABLE [ncts2].[ref_urzedy_celne_podmioty] (
    [id]             BIGINT        NOT NULL,
    [urzad_celny_id] BIGINT        NULL,
    [nazwa]          NVARCHAR (35) NULL,
    [kod_jezyka]     NVARCHAR (2)  NULL,
    [tin]            NVARCHAR (17) NULL,
    CONSTRAINT [ref_urzedy_celne_podmioty_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

