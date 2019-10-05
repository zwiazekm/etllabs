CREATE TABLE [akc].[POG_ZalacznikR_Gry] (
    [IdDok]                              VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]               CHAR (2)        NOT NULL,
    [NumerZalacznika]                    INT             NOT NULL,
    [NumerPozycji]                       INT             NOT NULL,
    [LiczbaAutomatWszystkPunktGier]      DECIMAL (19, 3) NULL,
    [StawkaPodatkuOdGierNaJednymAutomat] DECIMAL (19, 2) NULL,
    [ZryczaltowanyPodatek]               DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_POG_ZalacznikR_Gry] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznika] ASC, [NumerPozycji] ASC) ON [FG_AKC],
    CONSTRAINT [FK_POG_ZalacznikR_Gry_IdDokNumerZalacznika_POG_ZalacznikR_IdDokNumerZalacznika] FOREIGN KEY ([IdDok], [NumerZalacznika]) REFERENCES [akc].[POG_ZalacznikR] ([IdDok], [NumerZalacznika])
);

