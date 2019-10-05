CREATE TABLE [aes2].[ZWU_Oplata] (
    [Id]         NUMERIC (19)    NOT NULL,
    [Kwota]      NUMERIC (15, 2) NULL,
    [Podstawa]   NUMERIC (17, 2) NULL,
    [MP]         NVARCHAR (1)    NULL,
    [MPPid]      NVARCHAR (1)    NULL,
    [Stawka]     NUMERIC (7, 2)  NULL,
    [Typ]        NVARCHAR (3)    NULL,
    [TypPid]     NVARCHAR (3)    NULL,
    [IdTowarZWU] NUMERIC (19)    NULL,
    CONSTRAINT [ZWU_Oplata$PK_ZWU_Oplata] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_Oplata_IdTowarZWU_ZWU_Towar_id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [aes2].[ZWU_Towar] ([Id])
);

