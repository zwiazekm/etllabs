CREATE TABLE [cel].[sl_transakcje] (
    [kod]  VARCHAR (10)   NOT NULL,
    [opis] NVARCHAR (300) NULL,
    CONSTRAINT [PK_sl_transakcje] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90)
);

