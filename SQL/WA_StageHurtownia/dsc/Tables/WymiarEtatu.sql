CREATE TABLE [dsc].[WymiarEtatu] (
    [IDWymiarEtatu] INT NOT NULL,
    [IDPracownik]   INT NOT NULL,
    [IDUmowa]       INT NOT NULL,
    [WymiarEtatu]   INT NOT NULL,
    CONSTRAINT [PK_WymiarEtatu] PRIMARY KEY CLUSTERED ([IDWymiarEtatu] ASC)
);

