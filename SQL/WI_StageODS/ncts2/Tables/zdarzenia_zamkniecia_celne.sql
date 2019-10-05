CREATE TABLE [ncts2].[zdarzenia_zamkniecia_celne] (
    [id]           BIGINT        NOT NULL,
    [zdarzenie_id] BIGINT        NULL,
    [poz_id]       INT           NULL,
    [numer]        NVARCHAR (20) NULL,
    CONSTRAINT [zdarzenia_zamkniecia_celne_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

