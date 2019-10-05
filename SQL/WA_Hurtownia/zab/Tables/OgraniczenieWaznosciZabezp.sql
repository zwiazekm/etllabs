CREATE TABLE [zab].[OgraniczenieWaznosciZabezp] (
    [IdZabezpieczenia] INT NOT NULL,
    [OgraniczeniePid]  INT NOT NULL,
    CONSTRAINT [PK_OgraniczenieWaznosciZabezp] PRIMARY KEY CLUSTERED ([OgraniczeniePid] ASC, [IdZabezpieczenia] ASC) ON [FG_ZAB],
    CONSTRAINT [FK_OgraniczenieWaznosciZabezp_IdOgraniczenia_OgraniczenieWaznosci_IdOgraniczenia] FOREIGN KEY ([OgraniczeniePid]) REFERENCES [pdr].[c3512] ([c3512_id]),
    CONSTRAINT [FK_OgraniczenieWaznosciZabezp_IdZabezpieczenia_Zabezpieczenia_IdZabezpieczenia] FOREIGN KEY ([IdZabezpieczenia]) REFERENCES [zab].[Zabezpieczenia] ([IdZabezpieczenia])
);

