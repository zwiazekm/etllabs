CREATE TABLE [aimp2].[ZCP_TowarDokumentPoprzedniPozycje] (
    [IdPozycji]    NUMERIC (19) NOT NULL,
    [IdDokPoprzed] NUMERIC (19) NOT NULL,
    [NumerPozycji] NUMERIC (5)  NOT NULL,
    CONSTRAINT [ZCP_TowarDokumentPoprzedniPozycje_PK] PRIMARY KEY CLUSTERED ([IdPozycji] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_TowarDokumentPoprzedniPozycje$FK_ZCP_TowarDokumentPoprzedni] FOREIGN KEY ([IdDokPoprzed]) REFERENCES [aimp2].[ZCP_TowarDokumentPoprzedni] ([IdDokPoprzed])
);

