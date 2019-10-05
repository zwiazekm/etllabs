CREATE TABLE [zab].[StatusPodmiotuNaZabezp] (
    [IdZabezpieczenia] INT NOT NULL,
    [IdStatusPodmiotu] INT NOT NULL,
    CONSTRAINT [PK_StatusPodmiotuNaZabezp] PRIMARY KEY CLUSTERED ([IdZabezpieczenia] ASC, [IdStatusPodmiotu] ASC)
);

