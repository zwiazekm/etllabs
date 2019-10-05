CREATE TABLE [zab].[ProceduryAkcyzoweNaZabezp] (
    [IdZabezpieczenia]     INT NOT NULL,
    [ProceduraAkcyzowaPid] INT NOT NULL,
    CONSTRAINT [PK_ProceduryAkcyzoweNaZabezp] PRIMARY KEY CLUSTERED ([ProceduraAkcyzowaPid] ASC, [IdZabezpieczenia] ASC)
);

