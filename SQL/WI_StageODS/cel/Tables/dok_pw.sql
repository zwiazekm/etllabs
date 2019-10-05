CREATE TABLE [cel].[dok_pw] (
    [id_dok]    VARCHAR (30) NOT NULL,
    [Status]    VARCHAR (1)  NULL,
    [KodTransp] VARCHAR (2)  NULL,
    CONSTRAINT [PK_DOK_PW] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90)
);

