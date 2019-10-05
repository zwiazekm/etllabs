﻿CREATE TABLE [zc].[ZWU_DokumentWymagany] (
    [Id]            DECIMAL (19)   NOT NULL,
    [KodDokWym]     VARCHAR (4)    NULL,
    [NrDokWym]      NVARCHAR (35)  NULL,
    [StanNaGranicy] CHAR (1)       NULL,
    [GranicaKom]    NVARCHAR (140) NULL,
    [IdTowarZWU]    DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWU_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_DokumentWymagany_IdTowarZWU_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

