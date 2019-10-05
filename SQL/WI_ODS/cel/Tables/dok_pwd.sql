CREATE TABLE [cel].[dok_pwd] (
    [id_dok]       VARCHAR (30)  NOT NULL,
    [id_odbiorca]  VARCHAR (30)  NULL,
    [EtapBilans]   CHAR (1)      NULL,
    [Status]       CHAR (1)      NULL,
    [NrAkt]        VARCHAR (40)  NULL,
    [Uwagi]        VARCHAR (255) NULL,
    [OdpPU]        CHAR (1)      NULL,
    [TermOdpPU]    DATETIME      NULL,
    [FirmaNazwaPU] VARCHAR (255) NULL,
    [FirmaRegonPU] VARCHAR (20)  NULL,
    [Zefir]        CHAR (1)      NULL,
    [NazwiskoImie] VARCHAR (255) NULL,
    [NrDowOs]      VARCHAR (30)  NULL,
    CONSTRAINT [PK_DOK_PWD] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_PWD_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok]),
    CONSTRAINT [FK_DOK_PWD_REFERENCE_KONTRAHE] FOREIGN KEY ([id_odbiorca]) REFERENCES [cel].[kontrahenci] ([id_kntr])
);

