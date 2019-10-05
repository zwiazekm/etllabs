CREATE TABLE [aes2].[DWU_Kontener] (
    [Id]          NUMERIC (19)  NOT NULL,
    [NrKontenera] NVARCHAR (17) NULL,
    [IdTowarDWU]  NUMERIC (19)  NULL,
    CONSTRAINT [DWU_Kontener$PK_DWU_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWU_Kontener_IdTowarDWU__DWU_Towar_id] FOREIGN KEY ([IdTowarDWU]) REFERENCES [aes2].[DWU_Towar] ([Id])
);

