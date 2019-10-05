CREATE TABLE [ncts2].[RefProcUproszczTowWykluczone] (
    [Id]                         BIGINT        NOT NULL,
    [IdMiejscaLokalizacjiTowaru] BIGINT        NULL,
    [Kod]                        NVARCHAR (12) NULL,
    CONSTRAINT [RefProcUproszczTowWykluczone_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

