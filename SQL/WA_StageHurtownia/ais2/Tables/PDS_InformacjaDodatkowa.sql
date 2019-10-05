CREATE TABLE [ais2].[PDS_InformacjaDodatkowa] (
    [Id]                  NUMERIC (19) NOT NULL,
    [KodInfDodatkowej]    VARCHAR (5)  NULL,
    [KodInfDodatkowejPid] INT          NULL,
    [IdTowarPDS]          NUMERIC (19) NULL,
    CONSTRAINT [PDS_InformacjaDodatkowa$PK_PDS_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

