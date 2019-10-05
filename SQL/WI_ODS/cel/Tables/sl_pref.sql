CREATE TABLE [cel].[sl_pref] (
    [kod]  CHAR (10)    NOT NULL,
    [opis] VARCHAR (50) NULL,
    CONSTRAINT [PK_sl_pref] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

