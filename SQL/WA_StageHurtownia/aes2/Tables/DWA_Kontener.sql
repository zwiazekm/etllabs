CREATE TABLE [aes2].[DWA_Kontener] (
    [Id]            NUMERIC (19)  NOT NULL,
    [StanKontenera] NCHAR (1)     NULL,
    [NrKontenera]   NVARCHAR (17) NULL,
    [IdTowarDWA]    NUMERIC (19)  NULL,
    CONSTRAINT [DWA_Kontener$PK_DWA_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC)
);

