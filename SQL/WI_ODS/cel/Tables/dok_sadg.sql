CREATE TABLE [cel].[dok_sadg] (
    [id_dok]     VARCHAR (30)  NOT NULL,
    [SymDokZ]    VARCHAR (40)  NULL,
    [PotwWywozu] CHAR (1)      NULL,
    [EtapBilans] CHAR (1)      NULL,
    [P37]        VARCHAR (6)   NULL,
    [Uwagi]      VARCHAR (255) NULL,
    [Status]     CHAR (1)      NULL,
    CONSTRAINT [PK_DOK_SADG] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_SADG_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);


GO
CREATE NONCLUSTERED INDEX [sadg_symdokz_idx]
    ON [cel].[dok_sadg]([SymDokZ] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];

