CREATE TABLE [zc].[PDS_Kontener] (
    [Id]            DECIMAL (19)  NOT NULL,
    [NrKontenera]   VARCHAR (255) NULL,
    [StanKontenera] VARCHAR (4)   NULL,
    [IdTowarPDS]    DECIMAL (19)  NULL,
    CONSTRAINT [PK_PDS_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC)
);

