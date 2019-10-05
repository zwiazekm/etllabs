CREATE TABLE [ncts2].[AnalizaRyzykaMetodyKontroli] (
    [Id]                       BIGINT        NOT NULL,
    [IdObslugiWskazanKontroli] BIGINT        NOT NULL,
    [PoziomZdefiniowania]      NVARCHAR (36) NOT NULL,
    [MetodaKontroli]           NVARCHAR (36) NOT NULL,
    CONSTRAINT [AnalizaRyzykaMetodyKontroli_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [AnalizaRyzykaMetodyKontroli_AnalizaRyzykaObslugaWskazanKontroli_Id_fk] FOREIGN KEY ([IdObslugiWskazanKontroli]) REFERENCES [ncts2].[AnalizaRyzykaObslugaWskazanKontroli] ([Id])
);

