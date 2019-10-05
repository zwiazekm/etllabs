CREATE TABLE [ncts2].[ref_urzedy_celne_lsd] (
    [id]                      BIGINT        NOT NULL,
    [urzad_celny_id]          BIGINT        NULL,
    [kod_jezyka]              NVARCHAR (2)  NULL,
    [nazwa_zwyczajowa_urzedu] NVARCHAR (35) NULL,
    [ulica_numer]             NVARCHAR (35) NULL,
    [miasto]                  NVARCHAR (35) NULL,
    [flaga_prefix_suffix]     BIT           NULL,
    [prefix_suffix_nazwa]     NVARCHAR (35) NULL,
    [przestrzen_do_dodania]   BIT           NULL,
    [poziom_prefix_suffix]    NVARCHAR (1)  NULL,
    CONSTRAINT [ref_urzedy_celne_lsd_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ref_urzedy_celne_lsd_timer_typ_id_id_fk] FOREIGN KEY ([urzad_celny_id]) REFERENCES [ncts2].[ref_urzedy_celne] ([id])
);

