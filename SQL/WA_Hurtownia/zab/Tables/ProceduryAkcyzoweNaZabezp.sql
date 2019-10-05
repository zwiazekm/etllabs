CREATE TABLE [zab].[ProceduryAkcyzoweNaZabezp] (
    [IdZabezpieczenia]     INT NOT NULL,
    [ProceduraAkcyzowaPid] INT NOT NULL,
    CONSTRAINT [PK_ProceduryAkcyzoweNaZabezp] PRIMARY KEY CLUSTERED ([ProceduraAkcyzowaPid] ASC, [IdZabezpieczenia] ASC) ON [FG_ZAB],
    CONSTRAINT [FK_ProceduryAkcyzoweNaZabezp_IdProcedury_ProceduryAkcyzowe_IdProcedury] FOREIGN KEY ([ProceduraAkcyzowaPid]) REFERENCES [pdr].[c3508] ([c3508_id]),
    CONSTRAINT [FK_ProceduryAkcyzoweNaZabezp_IdZabezpieczenia_Zabezpieczenia_IdZabezpieczenia] FOREIGN KEY ([IdZabezpieczenia]) REFERENCES [zab].[Zabezpieczenia] ([IdZabezpieczenia])
);

