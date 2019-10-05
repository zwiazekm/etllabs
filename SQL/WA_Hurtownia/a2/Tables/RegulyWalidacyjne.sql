CREATE TABLE [a2].[RegulyWalidacyjne] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [CzyAktywna]        BIT           NOT NULL,
    [NazwaReguly]       VARCHAR (50)  NOT NULL,
    [TabelaWalidowana]  VARCHAR (100) NOT NULL,
    [KolumnaWalidowana] VARCHAR (60)  NOT NULL,
    [WarunekBledu]      VARCHAR (400) NULL,
    [BazaDanych]        [sysname]     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

