CREATE TABLE [cel].[dok_info] (
    [id_dok]        VARCHAR (30) NOT NULL,
    [RodzDok]       VARCHAR (5)  NULL,
    [SymDok]        VARCHAR (40) NULL,
    [XMLVer]        VARCHAR (7)  NULL,
    [ExtractDate]   DATETIME     NULL,
    [IdJedn]        VARCHAR (6)  NULL,
    [Pas]           VARCHAR (2)  NULL,
    [DataPrzyjEwid] DATETIME     NULL,
    [DataRej]       DATETIME     NULL,
    [Flaga]         CHAR (1)     NULL,
    CONSTRAINT [PK_DOK_INFO] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);


GO
CREATE NONCLUSTERED INDEX [AR_dok_info]
    ON [cel].[dok_info]([ExtractDate] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [sym_dok]
    ON [cel].[dok_info]([SymDok] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];

