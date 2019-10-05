CREATE TABLE [ncts2].[gwarancje_niewazne_kraje] (
    [gwarancja_id] BIGINT       NULL,
    [kod_kraju]    NVARCHAR (2) NULL,
    [id]           BIGINT       NOT NULL,
    [poz_id]       INT          NULL,
    CONSTRAINT [gwarancje_niewazne_kraje_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [gwarancje_niewazne_kraje_gwarancja_id_gwarancje_fk] FOREIGN KEY ([gwarancja_id]) REFERENCES [ncts2].[gwarancje] ([id])
);

