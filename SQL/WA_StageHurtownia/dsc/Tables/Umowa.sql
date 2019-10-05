CREATE TABLE [dsc].[Umowa] (
    [IDUmowa]                        INT      NOT NULL,
    [IDPracownik]                    INT      NULL,
    [IDKodRodzajUmowy]               INT      NOT NULL,
    [DataRozwiazaniaSluzbyPracy]     DATETIME NULL,
    [DataPoczatkuSluzbyPracy]        DATETIME NOT NULL,
    [IDKodRodzajSluzbyPracy]         INT      NOT NULL,
    [IDKodStatusZatrudnienia]        INT      NOT NULL,
    [IDSposobRozwiazaniaSluzbyPracy] INT      NULL,
    CONSTRAINT [PK_Umowa] PRIMARY KEY CLUSTERED ([IDUmowa] ASC)
);

