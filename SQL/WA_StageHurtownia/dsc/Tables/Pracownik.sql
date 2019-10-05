CREATE TABLE [dsc].[Pracownik] (
    [IDPracownik]   INT      NOT NULL,
    [IDKodPlec]     INT      NOT NULL,
    [DataUrodzenia] DATETIME NOT NULL,
    CONSTRAINT [PK_Pracownicy] PRIMARY KEY CLUSTERED ([IDPracownik] ASC)
);

