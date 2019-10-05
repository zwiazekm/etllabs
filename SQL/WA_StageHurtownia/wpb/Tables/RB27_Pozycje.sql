CREATE TABLE [wpb].[RB27_Pozycje] (
    [IdDok]                  VARCHAR (30)    NOT NULL,
    [NumerPozycji]           SMALLINT        NOT NULL,
    [Dzial]                  VARCHAR (10)    NULL,
    [Rozdzial]               VARCHAR (10)    NULL,
    [Paragraf]               VARCHAR (10)    NULL,
    [Plan]                   DECIMAL (19, 2) NULL,
    [Naleznosci]             DECIMAL (19, 2) NULL,
    [Potracenia]             DECIMAL (19, 2) NULL,
    [DochodyWykonane]        DECIMAL (19, 2) NULL,
    [DochodyPrzekazane]      DECIMAL (19, 2) NULL,
    [SaldoKoncoweOgolem]     DECIMAL (19, 2) NULL,
    [SaldoKoncoweZaleglosci] DECIMAL (19, 2) NULL,
    [SaldoKoncoweNadplaty]   DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_RB27_Pozycje] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

