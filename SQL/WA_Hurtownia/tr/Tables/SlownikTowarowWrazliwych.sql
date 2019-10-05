CREATE TABLE [tr].[SlownikTowarowWrazliwych] (
    [SID]                  INT             NOT NULL,
    [IDJednostkiMiary]     VARCHAR (3)     NULL,
    [GranicaTerytoriumEWG] CHAR (1)        NULL,
    [IloscReferencyjna]    DECIMAL (14, 3) NULL,
    [KlasaHS]              VARCHAR (6)     NOT NULL,
    [KodTowarowWrazliwych] CHAR (2)        NULL,
    CONSTRAINT [PK_SlownikTowarowWrazliwych] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_SlownikTowarowWrazliwych_IDJednostkiMiary_JednostkiMiary_ID] FOREIGN KEY ([IDJednostkiMiary]) REFERENCES [tr].[JednostkiMiary] ([Id])
);

