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
    CONSTRAINT [PK_PozwoleniaNaProceduryUproszczone] PRIMARY KEY CLUSTERED ([NrPozwolenia] ASC, [Lokalizacja] ASC, [TypDeklaracji] ASC) ON [FG_TR],
    CONSTRAINT [FK_PozwoleniaNaProceduryUproszczone_NrPozwolenia] FOREIGN KEY ([NrPozwolenia]) REFERENCES [tr].[NryPozwNaProcedureUproszczona] ([NrPozwolenia]),
    CONSTRAINT [FK_PozwoleniaNaProceduryUproszczone_SIDPodmiotuPDR_PodmiotyPDR_SID] FOREIGN KEY ([SIDPodmiotuPDR]) REFERENCES [tr].[PodmiotyPDR] ([SID])
);

