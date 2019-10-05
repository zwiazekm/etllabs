CREATE TABLE [cel].[kontenery] (
    [id_dok] VARCHAR (30) NOT NULL,
    [PozId]  NUMERIC (2)  NOT NULL,
    [Nr]     VARCHAR (40) NULL,
    CONSTRAINT [PK_KONTENERY] PRIMARY KEY CLUSTERED ([id_dok] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

