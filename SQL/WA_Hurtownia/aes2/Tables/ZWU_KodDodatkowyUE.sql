CREATE TABLE [aes2].[ZWU_KodDodatkowyUE] (
    [Id]         NUMERIC (19) NOT NULL,
    [KodUEPid]   NVARCHAR (4) NULL,
    [KodUE]      NVARCHAR (4) NULL,
    [IdTowarZWU] NUMERIC (19) NULL,
    CONSTRAINT [ZWU_KodDodatkowyUE$PK_ZWU_KodDodatkowyUE] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_KodDodatkowyUE_IdTowarZWU_ZWU_Towar_id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [aes2].[ZWU_Towar] ([Id])
);

