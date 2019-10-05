CREATE TABLE [cel].[dok_dhu] (
    [id_dok]       VARCHAR (30)  NOT NULL,
    [EtapBilans]   CHAR (1)      NULL,
    [status]       CHAR (1)      NULL,
    [NrAkt]        VARCHAR (40)  NULL,
    [Uwagi]        VARCHAR (255) NULL,
    [FirmaNazwaPU] VARCHAR (255) NULL,
    [FirmaRegonPU] VARCHAR (20)  NULL,
    [NazwiskoImie] VARCHAR (255) NULL,
    [NrDowOs]      VARCHAR (30)  NULL,
    [PotwWyw]      CHAR (1)      NULL,
    [SymDokZ]      VARCHAR (40)  NULL,
    CONSTRAINT [PK_DOK_DHU] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_DHU_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

