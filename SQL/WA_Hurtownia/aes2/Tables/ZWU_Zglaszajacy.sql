CREATE TABLE [aes2].[ZWU_Zglaszajacy] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [UlicaNumer]                NVARCHAR (105) NULL,
    [KodPocztowy]               NVARCHAR (9)   NULL,
    [Miejscowosc]               NVARCHAR (105) NULL,
    [Nazwa]                     NVARCHAR (105) NULL,
    [Kraj]                      NVARCHAR (2)   NULL,
    [KrajPid]                   NVARCHAR (2)   NULL,
    [TIN]                       NVARCHAR (17)  NULL,
    [REGON]                     NVARCHAR (14)  NULL,
    [Przedstawicielstwo]        NVARCHAR (1)   NULL,
    [PrzedstawicielstwoPid]     NVARCHAR (1)   NULL,
    [WskaznikEksportera]        NVARCHAR (5)   NULL,
    [WskaznikEksporteraPid]     NVARCHAR (5)   NULL,
    [NrWpisuNaListe]            NVARCHAR (105) NULL,
    [DataWpisuNaListe]          DATETIME2 (3)  NULL,
    [IdDokZWU]                  NUMERIC (19)   NULL,
    [EORI]                      NVARCHAR (17)  NULL,
    [Email]                     NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    CONSTRAINT [ZWU_Zglaszajacy$PK_ZWU_Zglaszajacy] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_Zglaszajacy_IdDokZWU_ZWU_Dokument_id] FOREIGN KEY ([IdDokZWU]) REFERENCES [aes2].[ZWU_Dokument] ([Id])
);


GO
ALTER TABLE [aes2].[ZWU_Zglaszajacy] NOCHECK CONSTRAINT [FK__ZWU_Zglaszajacy_IdDokZWU_ZWU_Dokument_id];

