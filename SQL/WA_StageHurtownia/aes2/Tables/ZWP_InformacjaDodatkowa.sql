CREATE TABLE [aes2].[ZWP_InformacjaDodatkowa] (
    [Id]              NUMERIC (19)  NOT NULL,
    [KodInfDod]       NVARCHAR (5)  NULL,
    [KodInfDodPid]    NVARCHAR (5)  NULL,
    [Tekst]           NVARCHAR (70) NULL,
    [KodJezykaInfDod] NVARCHAR (2)  NULL,
    [IdTowarZWP]      NUMERIC (19)  NULL,
    CONSTRAINT [ZWP_InformacjaDodatkowa$PK_ZWP_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

