CREATE TABLE [zc].[ZWU_Oplata] (
    [Id]         DECIMAL (19)    NOT NULL,
    [SumaOplat]  DECIMAL (17, 2) NULL,
    [Typ]        CHAR (3)        NULL,
    [Podstawa]   DECIMAL (17, 2) NULL,
    [Stawka]     DECIMAL (7, 2)  NULL,
    [Kwota]      DECIMAL (15, 2) NULL,
    [MP]         CHAR (1)        NULL,
    [IdTowarZWU] DECIMAL (19)    NULL,
    CONSTRAINT [PK_ZWU_Oplata] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_Oplata_IdTowarZWU_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

