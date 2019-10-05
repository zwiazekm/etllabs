CREATE TABLE [emcs2].[AD_AnalizaRyzykaKontrPodsum] (
    [Id]                       NUMERIC (38)  NOT NULL,
    [IdObslugiWskazanKontroli] NUMERIC (38)  NULL,
    [NrPozycji]                NUMERIC (38)  NULL,
    [ZakresPrzebiegKontroliSO] VARCHAR (200) NULL,
    [WynikKontroliSO]          VARCHAR (36)  NULL,
    CONSTRAINT [AD_AnalizaRyzykaKontrPodsum$PK_AD_AnalizaRyzykaKontrPodsum] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_EMCS2]
);

