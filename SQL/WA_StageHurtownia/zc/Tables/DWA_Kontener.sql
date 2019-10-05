CREATE TABLE [zc].[DWA_Kontener] (
    [Id]            DECIMAL (19) NOT NULL,
    [NrKontenera]   VARCHAR (17) NULL,
    [StanKontenera] CHAR (1)     NULL,
    [IdTowarDWA]    DECIMAL (19) NULL,
    CONSTRAINT [PK_DWA_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC)
);

