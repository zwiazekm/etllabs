CREATE TABLE [ncts2].[AnalizaRyzykaObslugaWskazanKontroliPozycje] (
    [Id]                       BIGINT NOT NULL,
    [IdObslugiWskazanKontroli] BIGINT NULL,
    [NumerPozycji]             INT    NULL,
    CONSTRAINT [AnalizaRyzykaObslugaWskazanKontroliPozycje_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

