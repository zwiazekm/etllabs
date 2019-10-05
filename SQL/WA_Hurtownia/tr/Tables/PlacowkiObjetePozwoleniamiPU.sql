CREATE TABLE [tr].[PlacowkiObjetePozwoleniamiPU] (
    [IdPlacowki]   VARCHAR (8)  NOT NULL,
    [NrPozwolenia] VARCHAR (17) NOT NULL,
    CONSTRAINT [PK_PlacowkiObjetePozwoleniamiPU] PRIMARY KEY CLUSTERED ([IdPlacowki] ASC, [NrPozwolenia] ASC) ON [FG_TR],
    CONSTRAINT [FK_PlacowkiObjetePozwoleniamiPU_NrPozwolenia] FOREIGN KEY ([NrPozwolenia]) REFERENCES [tr].[NryPozwNaProcedureUproszczona] ([NrPozwolenia])
);

