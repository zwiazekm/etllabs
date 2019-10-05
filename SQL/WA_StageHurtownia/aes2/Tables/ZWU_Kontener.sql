CREATE TABLE [aes2].[ZWU_Kontener] (
    [Id]            NUMERIC (19)  NOT NULL,
    [StanKontenera] NCHAR (1)     NOT NULL,
    [NrKontenera]   NVARCHAR (17) NULL,
    [IdTowarZWU]    NUMERIC (19)  NULL,
    CONSTRAINT [ZWU_Kontener$PK_ZWU_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC)
);

