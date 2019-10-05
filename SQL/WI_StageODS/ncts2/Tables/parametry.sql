CREATE TABLE [ncts2].[parametry] (
    [id]      BIGINT          NOT NULL,
    [sekcja]  NVARCHAR (32)   NULL,
    [nazwa]   NVARCHAR (64)   NULL,
    [opis]    NVARCHAR (256)  NULL,
    [wartosc] NVARCHAR (1000) NULL,
    CONSTRAINT [parametry_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

