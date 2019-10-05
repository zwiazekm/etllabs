CREATE TABLE [cel].[sl_dyrektyw] (
    [kod]  CHAR (16) NOT NULL,
    [opis] TEXT      NULL,
    CONSTRAINT [PK_sl_dyrektyw] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90)
);

