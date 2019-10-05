CREATE TABLE [aes2].[ZWP_Kontener] (
    [Id]            NUMERIC (19)    NOT NULL,
    [StanKontenera] NCHAR (1)       NOT NULL,
    [NrKontenera]   NVARCHAR (1530) NULL,
    [IdTowarZWP]    NUMERIC (19)    NULL,
    CONSTRAINT [ZWP_Kontener$PK_ZWP_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWP_Kontener_IdTowarZWP__ZWP_Towar_id] FOREIGN KEY ([IdTowarZWP]) REFERENCES [aes2].[ZWP_Towar] ([id])
);

