CREATE TABLE [dsc].[Zatrudnienie] (
    [IDZatrudnienie]           INT NOT NULL,
    [IDPracownik]              INT NOT NULL,
    [IDUmowa]                  INT NOT NULL,
    [IDJednostkaOrganizacyjna] INT NOT NULL,
    [IDKomorkaOrganizacyjna]   INT NOT NULL,
    [IDStanowisko]             INT NOT NULL,
    CONSTRAINT [PK_Zatrudnienie] PRIMARY KEY CLUSTERED ([IDZatrudnienie] ASC) ON [FG_DSC],
    CONSTRAINT [FK_Zatrudnienie_IDJednostkaOrganizacyjna_JednostkaOrganizacyjna_IDJednostkaOrganizacyjna] FOREIGN KEY ([IDJednostkaOrganizacyjna]) REFERENCES [dsc].[JednostkaOrganizacyjna] ([IDJednostkaOrganizacyjna]),
    CONSTRAINT [FK_Zatrudnienie_IDKomorkaOrganizacyjna_JednostkaOrganizacyjna_IDJednostkaOrganizacyjna] FOREIGN KEY ([IDKomorkaOrganizacyjna]) REFERENCES [dsc].[JednostkaOrganizacyjna] ([IDJednostkaOrganizacyjna]),
    CONSTRAINT [FK_Zatrudnienie_IDPracownik_Pracownik_IDPracownik] FOREIGN KEY ([IDPracownik]) REFERENCES [dsc].[Pracownik] ([IDPracownik]),
    CONSTRAINT [FK_Zatrudnienie_IDStanowisko_Stanowisko_IDStanowisko] FOREIGN KEY ([IDStanowisko]) REFERENCES [dsc].[Stanowisko] ([IDStanowisko]),
    CONSTRAINT [FK_Zatrudnienie_IDUmowa_Umowa_IDUmowa] FOREIGN KEY ([IDUmowa]) REFERENCES [dsc].[Umowa] ([IDUmowa])
);

