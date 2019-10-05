CREATE TABLE [cel].[dok_psp] (
    [id_dok]        VARCHAR (30)  NOT NULL,
    [Status]        CHAR (1)      NULL,
    [id_przewoznik] VARCHAR (30)  NULL,
    [kierunek]      VARCHAR (6)   NULL,
    [KodTransp]     VARCHAR (2)   NULL,
    [Uwagi]         VARCHAR (255) NULL,
    CONSTRAINT [PK_DOK_PSP] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90)
);

