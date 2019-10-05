CREATE TABLE [aes2].[DWU_Kontener] (
    [Id]          NUMERIC (19)  NOT NULL,
    [NrKontenera] NVARCHAR (17) NULL,
    [IdTowarDWU]  NUMERIC (19)  NULL,
    CONSTRAINT [DWU_Kontener$PK_DWU_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC)
);

