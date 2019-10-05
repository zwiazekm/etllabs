CREATE TABLE [tr].[PlacowkiObjetePozwoleniamiPU] (
    [IdPlacowki]   VARCHAR (8)  NOT NULL,
    [NrPozwolenia] VARCHAR (17) NOT NULL,
    CONSTRAINT [PK_PlacowkiObjetePozwoleniamiPU] PRIMARY KEY CLUSTERED ([IdPlacowki] ASC, [NrPozwolenia] ASC)
);

