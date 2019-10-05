CREATE TABLE [aimp2].[ZCP_DokumentPoprzedniPozycje] (
    [IdPozycji]    NUMERIC (19) NOT NULL,
    [IdDokPoprzed] NUMERIC (19) NOT NULL,
    [NumerPozycji] NUMERIC (5)  NULL,
    CONSTRAINT [ZCP_DokumentPoprzedniPozycje_PK] PRIMARY KEY CLUSTERED ([IdPozycji] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_DokumentPoprzedniPozycje$FK_ZCP_DokumentPoprzedni] FOREIGN KEY ([IdDokPoprzed]) REFERENCES [aimp2].[ZCP_DokumentPoprzedni] ([IdDokPoprzed])
);

