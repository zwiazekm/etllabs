CREATE TABLE [dsc].[WymiarEtatu] (
    [IDWymiarEtatu] INT NOT NULL,
    [IDPracownik]   INT NOT NULL,
    [IDUmowa]       INT NOT NULL,
    [WymiarEtatu]   INT NOT NULL,
    CONSTRAINT [PK_WymiarEtatu] PRIMARY KEY CLUSTERED ([IDWymiarEtatu] ASC) ON [FG_DSC],
    CONSTRAINT [FK_WymiarEtatu_IDPracownik_Pracownik_IDPracownik] FOREIGN KEY ([IDPracownik]) REFERENCES [dsc].[Pracownik] ([IDPracownik]),
    CONSTRAINT [FK_WymiarEtatu_IDUmowa_Umowa_IDUmowa] FOREIGN KEY ([IDUmowa]) REFERENCES [dsc].[Umowa] ([IDUmowa]),
    CONSTRAINT [FK_WymiarEtatu_WymiarEtatu_Slownik_ID] FOREIGN KEY ([WymiarEtatu]) REFERENCES [dsc].[Slownik] ([ID])
);

