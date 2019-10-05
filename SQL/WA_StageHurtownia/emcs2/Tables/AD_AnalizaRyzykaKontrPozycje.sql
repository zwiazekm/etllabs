CREATE TABLE [emcs2].[AD_AnalizaRyzykaKontrPozycje] (
    [Id]                       NUMERIC (38) NOT NULL,
    [IdObslugiWskazanKontroli] NUMERIC (38) NULL,
    [NrPozycji]                NUMERIC (38) NULL,
    CONSTRAINT [AD_AnalizaRyzykaKontrPozycje$PK_AD_AnalizaRyzykaKontrPozycje] PRIMARY KEY CLUSTERED ([Id] ASC)
);

