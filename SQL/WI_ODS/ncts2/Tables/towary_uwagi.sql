CREATE TABLE [ncts2].[towary_uwagi] (
    [id]                           BIGINT         NOT NULL,
    [towar_id]                     BIGINT         NULL,
    [uwagi]                        NVARCHAR (140) NULL,
    [uwagi_jezyk]                  NVARCHAR (2)   NULL,
    [tryb_utworzenia_pozycji]      NVARCHAR (1)   NULL,
    [iteracja_uwag_rozladunkowych] SMALLINT       NULL,
    CONSTRAINT [towary_uwagi_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [towary_uwagi_towar_id_id_fk] FOREIGN KEY ([towar_id]) REFERENCES [ncts2].[towary] ([id])
);

