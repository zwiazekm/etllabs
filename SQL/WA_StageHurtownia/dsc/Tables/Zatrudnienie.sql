CREATE TABLE [dsc].[Zatrudnienie] (
    [IDZatrudnienie]           INT NOT NULL,
    [IDPracownik]              INT NOT NULL,
    [IDUmowa]                  INT NOT NULL,
    [IDJednostkaOrganizacyjna] INT NOT NULL,
    [IDKomorkaOrganizacyjna]   INT NOT NULL,
    [IDStanowisko]             INT NOT NULL,
    CONSTRAINT [PK_Zatrudnienie] PRIMARY KEY CLUSTERED ([IDZatrudnienie] ASC)
);

