﻿CREATE TABLE [emcs2].[AD_SADPrzywozu] (
    [Id]      NUMERIC (38)  NOT NULL,
    [NrSAD]   NVARCHAR (63) NOT NULL,
    [IdDokAD] NUMERIC (38)  NULL,
    CONSTRAINT [AD_SADPrzywozu$PK_AD_SADPrzywozu] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_EMCS2],
    CONSTRAINT [FK_AD_SADPrzywozu] FOREIGN KEY ([IdDokAD]) REFERENCES [emcs2].[AD_Dokument] ([Id])
);

