CREATE TABLE [zc].[ZWU_InformacjaDodatkowa] (
    [Id]           DECIMAL (19)  NOT NULL,
    [KodInfDod]    VARCHAR (5)   NULL,
    [KodInfDodPid] INT           NULL,
    [Tekst]        NVARCHAR (70) NULL,
    [IdTowarZWU]   DECIMAL (19)  NOT NULL,
    CONSTRAINT [PK_ZWU_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

