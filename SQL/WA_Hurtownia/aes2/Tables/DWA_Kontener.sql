CREATE TABLE [aes2].[DWA_Kontener] (
    [Id]            NUMERIC (19)  NOT NULL,
    [StanKontenera] NCHAR (1)     NULL,
    [NrKontenera]   NVARCHAR (17) NULL,
    [IdTowarDWA]    NUMERIC (19)  NULL,
    CONSTRAINT [DWA_Kontener$PK_DWA_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWA_Kontener_IdTowarDWA__DWA_Towar_id] FOREIGN KEY ([IdTowarDWA]) REFERENCES [aes2].[DWA_Towar] ([Id])
);

