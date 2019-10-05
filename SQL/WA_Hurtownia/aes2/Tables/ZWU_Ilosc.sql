CREATE TABLE [aes2].[ZWU_Ilosc] (
    [Id]                           NUMERIC (19)    NOT NULL,
    [Jm]                           NVARCHAR (3)    NULL,
    [JmPid]                        NVARCHAR (3)    NULL,
    [KwalifikatorJm]               NVARCHAR (1)    NULL,
    [KwalifikatorJmPid]            NVARCHAR (1)    NULL,
    [Ilosc]                        NUMERIC (18, 3) NULL,
    [IdTowarZWU]                   NUMERIC (19)    NULL,
    [NrPozycjiDokumentuWymaganego] NUMERIC (5)     NULL,
    CONSTRAINT [ZWU_Ilosc$PK_ZWU_Ilosc] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_Ilosc_IdTowarZWU_ZWU_Towar_id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [aes2].[ZWU_Towar] ([Id])
);

