CREATE TABLE [dsc].[Pracownik] (
    [IDPracownik]   INT      NOT NULL,
    [IDKodPlec]     INT      NOT NULL,
    [DataUrodzenia] DATETIME NOT NULL,
    CONSTRAINT [PK_Pracownicy] PRIMARY KEY CLUSTERED ([IDPracownik] ASC) ON [FG_DSC],
    CONSTRAINT [FK_Pracownik_IDKodPlec_Slownik_ID] FOREIGN KEY ([IDKodPlec]) REFERENCES [dsc].[Slownik] ([ID])
);

