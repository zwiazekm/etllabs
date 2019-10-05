CREATE TABLE [aes2].[ZWU_KodDodatkowyPL] (
    [Id]         NUMERIC (19) NOT NULL,
    [KodPLPid]   NVARCHAR (4) NULL,
    [KodPL]      NVARCHAR (4) NULL,
    [IdTowarZWU] NUMERIC (19) NULL,
    CONSTRAINT [ZWU_KodDodatkowyPL$PK_ZWU_KodDodatkowyPL] PRIMARY KEY CLUSTERED ([Id] ASC)
);

