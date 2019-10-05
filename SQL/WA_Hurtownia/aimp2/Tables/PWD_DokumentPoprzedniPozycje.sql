CREATE TABLE [aimp2].[PWD_DokumentPoprzedniPozycje] (
    [IdPozycjiDokPoprzed] NUMERIC (19) NOT NULL,
    [IdDokPoprzed]        NUMERIC (19) NOT NULL,
    [NumerPozycji]        NUMERIC (5)  NOT NULL,
    CONSTRAINT [PWD_DokumentPoprzedniPozycje_PK] PRIMARY KEY CLUSTERED ([IdPozycjiDokPoprzed] ASC) ON [FG_AIMP2],
    CONSTRAINT [PWD_DokumentPoprzedniPozycje$FK_PWD_DokumentPoprzedni] FOREIGN KEY ([IdDokPoprzed]) REFERENCES [aimp2].[PWD_DokumentPoprzedni] ([IdDokPoprzed])
);

