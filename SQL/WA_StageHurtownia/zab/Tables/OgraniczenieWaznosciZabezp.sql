CREATE TABLE [zab].[OgraniczenieWaznosciZabezp] (
    [IdZabezpieczenia] INT NOT NULL,
    [OgraniczeniePid]  INT NOT NULL,
    CONSTRAINT [PK_OgraniczenieWaznosciZabezp] PRIMARY KEY CLUSTERED ([OgraniczeniePid] ASC, [IdZabezpieczenia] ASC)
);

