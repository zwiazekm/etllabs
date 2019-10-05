CREATE TABLE [aes2].[ZUZ_KodDodatkowyUE] (
    [Id]              NUMERIC (19) NOT NULL,
    [KodUE]           NVARCHAR (4) NULL,
    [KodUEPid]        NVARCHAR (4) NULL,
    [IdTowarZUZ]      NUMERIC (19) NULL,
    [KodUEWUzupln]    NVARCHAR (4) NULL,
    [KodUEUWzuplnPid] NVARCHAR (4) NULL,
    CONSTRAINT [ZUZ_KodDodatkowyUE$PK_ZUZ_KodDodatkowyUE] PRIMARY KEY CLUSTERED ([Id] ASC)
);

