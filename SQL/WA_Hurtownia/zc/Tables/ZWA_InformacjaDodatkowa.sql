CREATE TABLE [zc].[ZWA_InformacjaDodatkowa] (
    [Id]         DECIMAL (19) NOT NULL,
    [KodInfDod]  VARCHAR (5)  NULL,
    [IdTowarZWA] DECIMAL (19) NULL,
    CONSTRAINT [PK_ZWA_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC]
);

