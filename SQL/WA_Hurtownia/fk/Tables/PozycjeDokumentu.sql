CREATE TABLE [fk].[PozycjeDokumentu] (
    [IdDok]           VARCHAR (30)    NOT NULL,
    [NumerPozycji]    SMALLINT        NOT NULL,
    [TypOplaty]       CHAR (6)        NULL,
    [KwotaNaleznosci] DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_PozycjeDokumentu] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerPozycji] ASC) ON [FG_FK],
    CONSTRAINT [FK_PozycjeDokumentu_IdDok_Mandaty_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [fk].[Mandaty] ([IdDok])
);

