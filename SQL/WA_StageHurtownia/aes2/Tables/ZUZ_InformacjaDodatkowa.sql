CREATE TABLE [aes2].[ZUZ_InformacjaDodatkowa] (
    [Id]           NUMERIC (19)  NOT NULL,
    [KodInfDod]    NVARCHAR (5)  NULL,
    [KodInfDodPid] NVARCHAR (5)  NULL,
    [Tekst]        NVARCHAR (70) NULL,
    [IdTowarZUZ]   NUMERIC (19)  NULL,
    CONSTRAINT [ZUZ_InformacjaDodatkowa$PK_ZUZ_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

