CREATE TABLE [ncts2].[AnalizaRyzykaObslugaWskazanKontroliPozycje] (
    [Id]                       BIGINT NOT NULL,
    [IdObslugiWskazanKontroli] BIGINT NOT NULL,
    [NumerPozycji]             INT    NOT NULL,
    CONSTRAINT [AnalizaRyzykaObslugaWskazanKontroliPozycje_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [AnalizaRyzykaObslugaWskazanKontroliPozycje_AnalizaRyzykaObslugaWskazanKontroli_Id_fk] FOREIGN KEY ([IdObslugiWskazanKontroli]) REFERENCES [ncts2].[AnalizaRyzykaObslugaWskazanKontroli] ([Id])
);

