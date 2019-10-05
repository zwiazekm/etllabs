CREATE TABLE [zc].[ZWU_Ilosc] (
    [Id]             DECIMAL (19)    NOT NULL,
    [Jm]             CHAR (3)        NULL,
    [KwalifikatorJm] CHAR (1)        NULL,
    [Ilosc]          DECIMAL (18, 3) NULL,
    [IdTowarZwu]     DECIMAL (19)    NULL,
    CONSTRAINT [PK_ZWU_Ilosc] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_Ilosc_IdTowarZwu_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZwu]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

