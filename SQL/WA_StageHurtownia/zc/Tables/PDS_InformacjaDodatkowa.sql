CREATE TABLE [zc].[PDS_InformacjaDodatkowa] (
    [Id]                  DECIMAL (19) NOT NULL,
    [KodInfDodatkowej]    VARCHAR (5)  NULL,
    [KodInfDodatkowejPid] INT          NULL,
    [IdTowarPDS]          DECIMAL (19) NULL,
    CONSTRAINT [PK_PDS_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

