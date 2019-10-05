CREATE TABLE [zc].[DT_ZamkniecieCelne] (
    [IdDok]            VARCHAR (30) NOT NULL,
    [IdPozycji]        TINYINT      NOT NULL,
    [RodzajZamkniecia] VARCHAR (6)  NULL,
    [Ilosc]            INT          NULL,
    [NrZamkniecia]     VARCHAR (20) NULL,
    CONSTRAINT [PK_DT_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DT_ZamkniecieCelne_IdDok_DT_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[DT_Dokument] ([IdDok])
);

