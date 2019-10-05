CREATE TABLE [aes2].[ZUZ_DokumentWymagany] (
    [Id]                  NUMERIC (19)  NOT NULL,
    [NrDokWym]            NVARCHAR (35) NULL,
    [NrDokWymWUzupln]     NVARCHAR (35) NULL,
    [KodDokWym]           NVARCHAR (4)  NULL,
    [KodDokWymPid]        NVARCHAR (4)  NULL,
    [KodDokWymWUzupln]    NVARCHAR (4)  NULL,
    [KodDokWymWUzuplnPid] NVARCHAR (4)  NULL,
    [IdTowarZUZ]          NUMERIC (19)  NULL,
    CONSTRAINT [ZUZ_DokumentWymagany$PK_ZUZ_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

