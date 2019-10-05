CREATE TABLE [cel].[sl_tranzyty] (
    [kod]  VARCHAR (4)    NOT NULL,
    [opis] NVARCHAR (250) NULL,
    CONSTRAINT [PK_sl_tranzyty] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90)
);

