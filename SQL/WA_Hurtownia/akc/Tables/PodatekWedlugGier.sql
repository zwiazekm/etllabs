CREATE TABLE [akc].[PodatekWedlugGier] (
    [IdDok]                               VARCHAR (30)    NOT NULL,
    [OgolemPodatekOdGierKasynaSalonyZalA] DECIMAL (19, 2) NULL,
    [OgolemPodatekOdGierLiczbowychZalC]   DECIMAL (19, 2) NULL,
    [OgolemPodatekOdBingoLoterFantZalD]   DECIMAL (19, 2) NULL,
    [OgolemPodatekOdGierNaAutomatZalR]    DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_PodatekWedlugGier] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_AKC],
    CONSTRAINT [FK_PodatekWedlugGier_IdDok_POG_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[POG_Deklaracja] ([IdDok])
);

