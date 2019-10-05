CREATE TABLE [ncts2].[dokumenty_poprzednie_wpt] (
    [towar_id] BIGINT        NULL,
    [kod]      NVARCHAR (6)  NULL,
    [nr]       NVARCHAR (35) NULL,
    [uwagi]    NVARCHAR (26) NULL,
    [id]       BIGINT        NOT NULL,
    [poz_id]   INT           NULL,
    CONSTRAINT [dokumenty_poprzednie_wpt_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [dokumenty_poprzednie_wpt_towar_id_towary_fk] FOREIGN KEY ([towar_id]) REFERENCES [ncts2].[towary] ([id])
);

