CREATE TABLE [fk].[KwalifikacjePrawne] (
    [IdDok]                    VARCHAR (30) NOT NULL,
    [NumerPozycjiKwalifikacji] SMALLINT     NOT NULL,
    [IdKwalifikacji]           CHAR (6)     NULL,
    CONSTRAINT [PK_KwalifikacjePrawne] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycjiKwalifikacji] ASC) ON [FG_FK],
    CONSTRAINT [FK_KwalifikacjePrawne_IdDok_Mandaty_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [fk].[Mandaty] ([IdDok])
);

