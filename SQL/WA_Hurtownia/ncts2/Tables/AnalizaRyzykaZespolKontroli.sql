CREATE TABLE [ncts2].[AnalizaRyzykaZespolKontroli] (
    [Id]                       BIGINT         NOT NULL,
    [IdObslugiWskazanKontroli] BIGINT         NOT NULL,
    [Login]                    NVARCHAR (200) NOT NULL,
    [RejestratorWynikowZISAR]  SMALLINT       NOT NULL,
    CONSTRAINT [AnalizaRyzykaZespolKontroli_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [AnalizaRyzykaZespolKontroli_AnalizaRyzykaObslugaWskazanKontroli_Id_fk] FOREIGN KEY ([IdObslugiWskazanKontroli]) REFERENCES [ncts2].[AnalizaRyzykaObslugaWskazanKontroli] ([Id])
);

