CREATE TABLE [zab].[StatusPodmiotuNaZabezp] (
    [IdZabezpieczenia] INT NOT NULL,
    [IdStatusPodmiotu] INT NOT NULL,
    CONSTRAINT [PK_StatusPodmiotuNaZabezp] PRIMARY KEY CLUSTERED ([IdZabezpieczenia] ASC, [IdStatusPodmiotu] ASC) ON [FG_ZAB],
    CONSTRAINT [FK_StatusPodmiotuNaZabezp_IdStatusPodmiotu_StatusPodmiotu_IdStatusPodmiotu] FOREIGN KEY ([IdStatusPodmiotu]) REFERENCES [zab].[StatusPodmiotu] ([IdStatusPodmiotu]),
    CONSTRAINT [FK_StatusPodmiotuNaZabezp_IdZabezpieczenia_Zabezpieczenia_IdZabezpieczenia] FOREIGN KEY ([IdZabezpieczenia]) REFERENCES [zab].[Zabezpieczenia] ([IdZabezpieczenia])
);

