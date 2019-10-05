CREATE TABLE [akc].[POG_ZalacznikR] (
    [IdDok]                        VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]         CHAR (2)        NOT NULL,
    [NumerZalacznika]              INT             NOT NULL,
    [LiczbaAutomatowWycofanych]    DECIMAL (20, 2) NULL,
    [LiczbaAutomatowZawieszonych]  DECIMAL (20, 2) NULL,
    [LiczbaAutomatowWprowadzonych] DECIMAL (20, 2) NULL,
    [PodatekNalezny]               DECIMAL (20, 2) NULL,
    CONSTRAINT [PK_POG_ZalacznikR] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznika] ASC)
);

