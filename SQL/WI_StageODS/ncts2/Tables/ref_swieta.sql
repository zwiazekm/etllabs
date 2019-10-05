CREATE TABLE [ncts2].[ref_swieta] (
    [id]        BIGINT       NOT NULL,
    [kod_kraju] NVARCHAR (2) NULL,
    [wazny_od]  DATETIME     NULL,
    [wazny_do]  DATETIME     NULL,
    CONSTRAINT [ref_swieta_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

