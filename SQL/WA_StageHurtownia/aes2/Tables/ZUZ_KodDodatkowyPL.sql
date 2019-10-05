CREATE TABLE [aes2].[ZUZ_KodDodatkowyPL] (
    [Id]              NUMERIC (19) NOT NULL,
    [KodPL]           NVARCHAR (4) NULL,
    [KodPLPid]        NVARCHAR (4) NULL,
    [IdTowarZUZ]      NUMERIC (19) NULL,
    [KodPLWUzupln]    NVARCHAR (4) NULL,
    [KodPLWUzuplnPid] NVARCHAR (4) NULL,
    CONSTRAINT [ZUZ_KodDodatkowyPL$PK_ZUZ_KodDodatkowyPL] PRIMARY KEY CLUSTERED ([Id] ASC)
);

