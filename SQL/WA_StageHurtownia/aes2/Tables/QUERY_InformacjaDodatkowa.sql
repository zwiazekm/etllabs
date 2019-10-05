CREATE TABLE [aes2].[QUERY_InformacjaDodatkowa] (
    [Id]              NUMERIC (19)  NOT NULL,
    [KodInfDod]       NVARCHAR (5)  NULL,
    [KodInfDodPid]    INT           NULL,
    [Tekst]           NVARCHAR (70) NULL,
    [KodJezykaInfDod] NVARCHAR (2)  NULL,
    [IdTowarQUERY]    NUMERIC (19)  NULL,
    CONSTRAINT [QUERY_InformacjaDodatkowa$PK_QUERY_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

