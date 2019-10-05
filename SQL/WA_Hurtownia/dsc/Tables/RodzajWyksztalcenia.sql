CREATE TABLE [dsc].[RodzajWyksztalcenia] (
    [IDRodzajWyksztalcenia]    INT NOT NULL,
    [IDKodPoziomWyksztalcenia] INT NULL,
    [IDPracownik]              INT NOT NULL,
    CONSTRAINT [PK_RodzajWyksztalcenia] PRIMARY KEY CLUSTERED ([IDRodzajWyksztalcenia] ASC) ON [FG_DSC],
    CONSTRAINT [FK_RodzajWyksztalcenia_IDKodPoziomKsztalcenia_Slownik_ID] FOREIGN KEY ([IDKodPoziomWyksztalcenia]) REFERENCES [dsc].[Slownik] ([ID]),
    CONSTRAINT [FK_RodzajWyksztalcenia_IDPracownik_Pracownik_IDPracownik] FOREIGN KEY ([IDPracownik]) REFERENCES [dsc].[Pracownik] ([IDPracownik])
);

