CREATE TABLE [cel].[sl_transport] (
    [kod]  VARCHAR (10)   NOT NULL,
    [opis] NVARCHAR (300) NULL,
    CONSTRAINT [PK_sl_transport] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90)
);

