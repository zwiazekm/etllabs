CREATE TABLE [akc].[OplataPaliwowa_Towary] (
    [IdDok]               VARCHAR (30)    NOT NULL,
    [NumerPozycji]        SMALLINT        NOT NULL,
    [GrupaWyrobow]        VARCHAR (6)     NULL,
    [Symbol]              VARCHAR (20)    NULL,
    [NazwaGrupyWyrobow]   VARCHAR (255)   NULL,
    [IloscWyrobow]        DECIMAL (19, 4) NULL,
    [IloscWyrobowWtonach] DECIMAL (19, 4) NULL,
    [KwotaOplatyPaliw]    DECIMAL (19, 1) NULL,
    CONSTRAINT [PK_OplataPaliwowa_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC) ON [FG_AKC],
    CONSTRAINT [FK_OplataPaliwowa_Towary_IdDok_OplataPaliwowa_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[OplataPaliwowa] ([IdDok])
);

