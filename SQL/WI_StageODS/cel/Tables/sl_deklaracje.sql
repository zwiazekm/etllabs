CREATE TABLE [cel].[sl_deklaracje] (
    [kod]  VARCHAR (4)    NOT NULL,
    [opis] NVARCHAR (250) NULL,
    CONSTRAINT [PK_sl_deklaracje] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90)
);

