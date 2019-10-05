CREATE TABLE [fk].[KwalifikacjePrawne] (
    [IdDok]                    VARCHAR (30) NOT NULL,
    [NumerPozycjiKwalifikacji] SMALLINT     NOT NULL,
    [IdKwalifikacji]           CHAR (6)     NULL,
    CONSTRAINT [PK_KwalifikacjePrawne] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycjiKwalifikacji] ASC)
);

