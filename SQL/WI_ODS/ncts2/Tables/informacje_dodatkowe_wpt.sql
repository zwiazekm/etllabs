CREATE TABLE [ncts2].[informacje_dodatkowe_wpt] (
    [towar_id]    BIGINT        NULL,
    [kod]         NVARCHAR (5)  NULL,
    [kraj_wywozu] NVARCHAR (2)  NULL,
    [tekst]       NVARCHAR (70) NULL,
    [id]          BIGINT        NOT NULL,
    [wywoz_z_ue]  BIT           NULL,
    [poz_id]      INT           NULL,
    CONSTRAINT [informacje_dodatkowe_wpt_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [informacje_dodatkowe_wpt_towar_id_towary_fk] FOREIGN KEY ([towar_id]) REFERENCES [ncts2].[towary] ([id])
);

