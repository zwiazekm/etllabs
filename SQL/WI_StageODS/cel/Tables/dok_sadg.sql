CREATE TABLE [cel].[dok_sadg] (
    [id_dok]     VARCHAR (30)  NOT NULL,
    [SymDokZ]    VARCHAR (40)  NULL,
    [PotwWywozu] VARCHAR (1)   NULL,
    [EtapBilans] VARCHAR (1)   NULL,
    [P37]        VARCHAR (6)   NULL,
    [Uwagi]      VARCHAR (255) NULL,
    [Status]     VARCHAR (1)   NULL,
    CONSTRAINT [PK_DOK_SADG] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90)
);

