CREATE TABLE [akc].[AKC4_ZalacznikE_Towary] (
    [IdDok]                       VARCHAR (30)    NOT NULL,
    [NumerZalacznikaSys]          INT             NOT NULL,
    [NumerPozycji]                INT             NOT NULL,
    [NazwaGrupyWyrobow]           VARCHAR (255)   NULL,
    [KodCN]                       VARCHAR (15)    NULL,
    [RodzajStawkiPodatAkc]        CHAR (1)        NULL,
    [PodstawObliczPodatku]        DECIMAL (19, 3) NULL,
    [PodstawObliczPodatkuProcent] DECIMAL (19, 2) NULL,
    [StawkaPodatku]               DECIMAL (19, 2) NULL,
    [StawkaPodatkuProcent]        DECIMAL (19, 2) NULL,
    [KwotaPodatku]                DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKC4_ZalacznikE_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC, [NumerPozycji] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKC4_ZalacznikE_Towary_IdDokNumerZalacznikaSys_AKC4_ZalacznikE_IdDokNumerZalacznikaSys] FOREIGN KEY ([IdDok], [NumerZalacznikaSys]) REFERENCES [akc].[AKC4_ZalacznikE] ([IdDok], [NumerZalacznikaSys])
);

