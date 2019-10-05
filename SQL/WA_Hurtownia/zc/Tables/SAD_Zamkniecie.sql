CREATE TABLE [zc].[SAD_Zamkniecie] (
    [IdDok]        BIGINT       NOT NULL,
    [IdPozycji]    SMALLINT     NOT NULL,
    [NrZamkniecia] VARCHAR (20) NULL,
    CONSTRAINT [PK_SAD_Zamkniecie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Zamkniecie_IdDok_SAD_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[SAD_Dokument] ([IdDok])
);

