CREATE TABLE [ncts2].[ref_podmioty_aeo] (
    [id]                 BIGINT        NOT NULL,
    [idsisc]             NVARCHAR (17) NULL,
    [numer]              NVARCHAR (25) NULL,
    [data_obowiazywania] DATETIME      NULL,
    [wazne_od]           DATETIME      NULL,
    [wazne_do]           DATETIME      NULL,
    CONSTRAINT [ref_podmioty_aeo_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

