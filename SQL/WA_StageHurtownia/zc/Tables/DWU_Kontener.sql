CREATE TABLE [zc].[DWU_Kontener] (
    [Id]          DECIMAL (19) NOT NULL,
    [NrKontenera] VARCHAR (17) NULL,
    [IdTowarDWU]  DECIMAL (19) NULL,
    CONSTRAINT [PK_DWU_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC)
);

