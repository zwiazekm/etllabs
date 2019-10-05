CREATE TABLE [cel].[sl_preferencje] (
    [kod]  VARCHAR (3)  NOT NULL,
    [opis] VARCHAR (70) NULL,
    CONSTRAINT [PK_sl_preferencje] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90)
);

