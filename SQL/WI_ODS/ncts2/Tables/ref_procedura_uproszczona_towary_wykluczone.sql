CREATE TABLE [ncts2].[ref_procedura_uproszczona_towary_wykluczone] (
    [id]                            BIGINT        NOT NULL,
    [miejsce_lokalizacji_towaru_id] BIGINT        NULL,
    [kod]                           NVARCHAR (12) NULL,
    CONSTRAINT [ref_procedura_uproszczona_towary_wykluczone_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ref_proc_upr_tow_wykl_miej_lok_tow_id_id_fk] FOREIGN KEY ([miejsce_lokalizacji_towaru_id]) REFERENCES [ncts2].[ref_procedura_uproszczona_miejsca_lokalizacji_towaru] ([id])
);

