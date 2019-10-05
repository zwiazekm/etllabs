CREATE TABLE [aes2].[ZWU_Korekta] (
    [Id]         NUMERIC (19)    NOT NULL,
    [IdTowarZWU] NUMERIC (19)    NULL,
    [KodKorekty] NVARCHAR (4)    NULL,
    [Wartosc]    NUMERIC (17, 2) NULL,
    CONSTRAINT [ZWU_Korekta$PK_ZWU_Korekta] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_Korekta_IdTowarZWU_ZWU_Towar_id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [aes2].[ZWU_Towar] ([Id])
);

