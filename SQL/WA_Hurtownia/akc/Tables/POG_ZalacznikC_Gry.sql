CREATE TABLE [akc].[POG_ZalacznikC_Gry] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika] CHAR (2)        NOT NULL,
    [NumerZalacznika]      INT             NOT NULL,
    [NumerPozycji]         INT             NOT NULL,
    [RodzajGry]            VARCHAR (255)   NULL,
    [KodGry]               VARCHAR (15)    NULL,
    [PodstawObliczPodatku] DECIMAL (19, 3) NULL,
    [StawkaPodatkuProcent] DECIMAL (19, 2) NULL,
    [KwotaPodatku]         DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_POG_ZalacznikC_Gry] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznika] ASC, [NumerPozycji] ASC) ON [FG_AKC],
    CONSTRAINT [FK_POG_ZalacznikC_Gry_IdDokNumerZalacznika_POG_ZalacznikC_IdDokNumerZalacznika] FOREIGN KEY ([IdDok], [NumerZalacznika]) REFERENCES [akc].[POG_ZalacznikC] ([IdDok], [NumerZalacznika])
);

