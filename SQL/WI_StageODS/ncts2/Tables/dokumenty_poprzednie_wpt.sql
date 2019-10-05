CREATE TABLE [ncts2].[dokumenty_poprzednie_wpt] (
    [towar_id] BIGINT        NULL,
    [kod]      NVARCHAR (6)  NULL,
    [nr]       NVARCHAR (35) NULL,
    [uwagi]    NVARCHAR (26) NULL,
    [id]       BIGINT        NOT NULL,
    [poz_id]   INT           NULL,
    CONSTRAINT [dokumenty_poprzednie_wpt_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

