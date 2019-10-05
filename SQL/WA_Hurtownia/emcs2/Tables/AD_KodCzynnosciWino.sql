CREATE TABLE [emcs2].[AD_KodCzynnosciWino] (
    [Id]               NUMERIC (38) NOT NULL,
    [KodCzynnosciWino] VARCHAR (2)  NOT NULL,
    [IdWyrobAD]        NUMERIC (38) NULL,
    CONSTRAINT [AD_KodCzynnosciWino$PK_AD_KodCzynnosciWino] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_EMCS2]
);

