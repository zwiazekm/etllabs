CREATE TABLE [akc].[PKOP_Towary] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [NumerPozycji]         INT             NOT NULL,
    [NazwaKopaliny]        VARCHAR (255)   NULL,
    [PodstawObliczPodatku] DECIMAL (19, 3) NULL,
    [SredniaCena]          DECIMAL (19, 3) NULL,
    [StawkaPodatku]        DECIMAL (19, 2) NULL,
    [KwotaPodatku]         DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_PKOP_Towary] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC)
);

