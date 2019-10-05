CREATE TABLE [ais2].[PDS_Kontener] (
    [Id]            NUMERIC (19)  NOT NULL,
    [NrKontenera]   VARCHAR (255) NULL,
    [StanKontenera] VARCHAR (4)   NULL,
    [IdTowarPDS]    NUMERIC (19)  NULL,
    CONSTRAINT [PDS_Kontener$PK_PDS_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AIS2],
    CONSTRAINT [FK__PDS_Kontener_IdTowarPDS__PDS_Towar_id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [ais2].[PDS_Towar] ([Id])
);

