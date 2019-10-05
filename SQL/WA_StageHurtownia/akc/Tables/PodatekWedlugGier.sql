CREATE TABLE [akc].[PodatekWedlugGier] (
    [IdDok]                               VARCHAR (30)    NOT NULL,
    [OgolemPodatekOdGierKasynaSalonyZalA] DECIMAL (19, 2) NULL,
    [OgolemPodatekOdGierLiczbowychZalC]   DECIMAL (19, 2) NULL,
    [OgolemPodatekOdBingoLoterFantZalD]   DECIMAL (19, 2) NULL,
    [OgolemPodatekOdGierNaAutomatZalR]    DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_PodatekWedlugGier] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

