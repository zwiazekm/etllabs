CREATE TABLE [ais2].[PDS_InformacjaDodatkowa] (
    [Id]                  NUMERIC (19) NOT NULL,
    [KodInfDodatkowej]    VARCHAR (5)  NULL,
    [KodInfDodatkowejPid] INT          NULL,
    [IdTowarPDS]          NUMERIC (19) NULL,
    CONSTRAINT [PDS_InformacjaDodatkowa$PK_PDS_InformacjaDodatkowa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AIS2],
    CONSTRAINT [FK__PDS_InformacjaDodatkowa_IdTowarPDS__PDS_Towar_id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [ais2].[PDS_Towar] ([Id])
);

