CREATE TABLE [aes2].[ZWU_DokumentWymagany] (
    [Id]                          NUMERIC (19)    NOT NULL,
    [StanNaGranicy]               NCHAR (1)       NOT NULL,
    [StanNaGranicyKom]            NVARCHAR (420)  NULL,
    [KodDokWym]                   NVARCHAR (4)    NULL,
    [KodDokWymPid]                NVARCHAR (4)    NULL,
    [NrDokWym]                    NVARCHAR (105)  NULL,
    [IdTowarZWU]                  NUMERIC (19)    NULL,
    [Uwagi]                       NVARCHAR (35)   NULL,
    [WynikKontroliAGREX]          NVARCHAR (3)    NULL,
    [InformacjaRozbieznosciAGREX] NVARCHAR (3072) NULL,
    [IloscTowaru]                 NUMERIC (16, 6) NULL,
    [JednostkaMiary]              NVARCHAR (3)    NULL,
    [NrPozycji]                   NUMERIC (5)     NULL,
    CONSTRAINT [ZWU_DokumentWymagany$PK_ZWU_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_DokumentWymagany_IdTowarZWU_ZWU_Towar_id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [aes2].[ZWU_Towar] ([Id])
);

