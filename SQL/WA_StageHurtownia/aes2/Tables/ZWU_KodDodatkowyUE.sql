CREATE TABLE [aes2].[ZWU_KodDodatkowyUE] (
    [Id]         NUMERIC (19) NOT NULL,
    [KodUEPid]   NVARCHAR (4) NULL,
    [KodUE]      NVARCHAR (4) NULL,
    [IdTowarZWU] NUMERIC (19) NULL,
    CONSTRAINT [ZWU_KodDodatkowyUE$PK_ZWU_KodDodatkowyUE] PRIMARY KEY CLUSTERED ([Id] ASC)
);

