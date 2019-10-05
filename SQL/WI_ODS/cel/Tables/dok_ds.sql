CREATE TABLE [cel].[dok_ds] (
    [id_dok]        VARCHAR (30)  NOT NULL,
    [id_skladajacy] VARCHAR (30)  NULL,
    [EtapBilans]    CHAR (1)      NULL,
    [Status]        CHAR (1)      NULL,
    [NrAkt]         VARCHAR (40)  NULL,
    [KodTransp]     VARCHAR (2)   NULL,
    [RodzDokZrd]    VARCHAR (6)   NULL,
    [SymDokZrd]     VARCHAR (40)  NULL,
    [Uwagi]         VARCHAR (255) NULL,
    [PU]            CHAR (1)      NULL,
    [OdpPU]         CHAR (1)      NULL,
    [TermOdpPU]     DATETIME      NULL,
    [FirmaNazwaPU]  VARCHAR (255) NULL,
    [FirmaRegonPU]  VARCHAR (20)  NULL,
    [TerminPrzezn]  DATETIME      NULL,
    [DataPrzedst]   DATETIME      NULL,
    CONSTRAINT [PK_DOK_DS] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_DS_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok]),
    CONSTRAINT [FK_DOK_DS_REFERENCE_KONTRAHE] FOREIGN KEY ([id_skladajacy]) REFERENCES [cel].[kontrahenci] ([id_kntr])
);

