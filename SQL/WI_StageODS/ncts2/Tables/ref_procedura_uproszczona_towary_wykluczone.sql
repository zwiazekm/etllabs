CREATE TABLE [ncts2].[ref_procedura_uproszczona_towary_wykluczone] (
    [id]                            BIGINT        NOT NULL,
    [miejsce_lokalizacji_towaru_id] BIGINT        NULL,
    [kod]                           NVARCHAR (12) NULL,
    CONSTRAINT [ref_procedura_uproszczona_towary_wykluczone_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

