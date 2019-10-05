CREATE TABLE [ncts2].[uwagi_rozladunkowe_zamkniecia_celne] (
    [id]                    BIGINT        NOT NULL,
    [uwagi_rozladunkowe_id] BIGINT        NULL,
    [poz_id]                INT           NULL,
    [numer]                 NVARCHAR (20) NULL,
    CONSTRAINT [uwagi_rozladunkowe_zamkniecia_celne_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

