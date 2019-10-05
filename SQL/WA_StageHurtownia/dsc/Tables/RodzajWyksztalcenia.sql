CREATE TABLE [dsc].[RodzajWyksztalcenia] (
    [IDRodzajWyksztalcenia]    INT NOT NULL,
    [IDKodPoziomWyksztalcenia] INT NULL,
    [IDPracownik]              INT NOT NULL,
    CONSTRAINT [PK_RodzajWyksztalcenia] PRIMARY KEY CLUSTERED ([IDRodzajWyksztalcenia] ASC)
);

