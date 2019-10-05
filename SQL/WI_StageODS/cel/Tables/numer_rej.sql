CREATE TABLE [cel].[numer_rej] (
    [id_dok] VARCHAR (30) NOT NULL,
    [PozId]  NUMERIC (2)  NOT NULL,
    [Numer]  VARCHAR (40) NULL,
    [Kraj]   VARCHAR (2)  NULL,
    CONSTRAINT [PK_NUMER_REJ] PRIMARY KEY CLUSTERED ([id_dok] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

