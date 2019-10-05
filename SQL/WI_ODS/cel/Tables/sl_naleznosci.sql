CREATE TABLE [cel].[sl_naleznosci] (
    [kod]  VARCHAR (10)   NOT NULL,
    [opis] NVARCHAR (250) NULL,
    CONSTRAINT [PK_sl_naleznosci] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

