CREATE TABLE [aes2].[ZWA_Kontener] (
    [Id]            NUMERIC (19)   NOT NULL,
    [StanKontenera] NCHAR (1)      NOT NULL,
    [NrKontenera]   NVARCHAR (765) NULL,
    [IdTowarZWA]    NUMERIC (19)   NULL,
    CONSTRAINT [ZWA_Kontener$PK_ZWA_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC)
);

