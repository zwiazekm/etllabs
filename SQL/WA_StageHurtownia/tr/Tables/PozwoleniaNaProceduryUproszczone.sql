CREATE TABLE [tr].[PozwoleniaNaProceduryUproszczone] (
    [NrPozwolenia]                 VARCHAR (17) NOT NULL,
    [Lokalizacja]                  VARCHAR (3)  NOT NULL,
    [DataWniosku]                  DATETIME     NOT NULL,
    [DataWystawieniaPozwolenia]    DATETIME     NOT NULL,
    [DataWaznosci]                 DATETIME     NULL,
    [MaksymalnyCzasPodrozy]        DECIMAL (2)  NULL,
    [SIDPodmiotuPDR]               INT          NULL,
    [IDUrzeduWydajacegoPozwolenie] VARCHAR (8)  NOT NULL,
    [TypDeklaracji]                VARCHAR (9)  NOT NULL,
    CONSTRAINT [PK_PozwoleniaNaProceduryUproszczone] PRIMARY KEY CLUSTERED ([NrPozwolenia] ASC, [Lokalizacja] ASC, [TypDeklaracji] ASC)
);

