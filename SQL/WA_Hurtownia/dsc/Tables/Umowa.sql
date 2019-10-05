CREATE TABLE [dsc].[Umowa] (
    [IDUmowa]                        INT      NOT NULL,
    [IDPracownik]                    INT      NULL,
    [IDKodRodzajUmowy]               INT      NOT NULL,
    [DataRozwiazaniaSluzbyPracy]     DATETIME NULL,
    [DataPoczatkuSluzbyPracy]        DATETIME NOT NULL,
    [IDKodRodzajSluzbyPracy]         INT      NOT NULL,
    [IDKodStatusZatrudnienia]        INT      NOT NULL,
    [IDSposobRozwiazaniaSluzbyPracy] INT      NULL,
    CONSTRAINT [PK_Umowa] PRIMARY KEY CLUSTERED ([IDUmowa] ASC) ON [FG_DSC],
    CONSTRAINT [FK_Umowa_IDKodRodzajSluzbyPracy_Slownik_ID] FOREIGN KEY ([IDKodRodzajSluzbyPracy]) REFERENCES [dsc].[Slownik] ([ID]),
    CONSTRAINT [FK_Umowa_IDKodRodzajUmowy_Slownik_ID] FOREIGN KEY ([IDKodRodzajUmowy]) REFERENCES [dsc].[Slownik] ([ID]),
    CONSTRAINT [FK_Umowa_IDKodStatusZatrudnienia_StatusZatrudnienia_IDKodStatusZatrudnienia] FOREIGN KEY ([IDKodStatusZatrudnienia]) REFERENCES [dsc].[StatusZatrudnienia] ([IDKodStatusZatrudnienia]),
    CONSTRAINT [FK_Umowa_IDPracownik_Pracownik_IDPracownik] FOREIGN KEY ([IDPracownik]) REFERENCES [dsc].[Pracownik] ([IDPracownik]),
    CONSTRAINT [FK_Umowa_IDSposobRozwiazaniaSluzbyPracy_Slownik_ID] FOREIGN KEY ([IDSposobRozwiazaniaSluzbyPracy]) REFERENCES [dsc].[Slownik] ([ID])
);

