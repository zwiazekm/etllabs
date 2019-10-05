CREATE TABLE [ncts2].[AnalizaRyzykaZespolKontroli] (
    [Id]                       BIGINT         NOT NULL,
    [IdObslugiWskazanKontroli] BIGINT         NULL,
    [Login]                    NVARCHAR (200) NULL,
    [RejestratorWynikowZISAR]  SMALLINT       NULL,
    CONSTRAINT [AnalizaRyzykaZespolKontroli_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

