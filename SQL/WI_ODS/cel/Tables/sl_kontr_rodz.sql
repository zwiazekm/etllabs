CREATE TABLE [cel].[sl_kontr_rodz] (
    [kod]  CHAR (1)     NOT NULL,
    [opis] VARCHAR (50) NULL,
    CONSTRAINT [PK_sl_kontr_rodz] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

