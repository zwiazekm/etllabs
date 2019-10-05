CREATE TABLE [aes2].[ZWU_InformacjaDodatkowa] (
    [Id]           NUMERIC (19)   NOT NULL,
    [IdTowarZWU]   NUMERIC (19)   NULL,
    [KodInfDod]    NVARCHAR (5)   NULL,
    [KodInfDodPid] NVARCHAR (5)   NULL,
    [Tekst]        NVARCHAR (210) NULL,
    CONSTRAINT [ZWU_InformacjaDodatkowa$PK_ZWU_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

