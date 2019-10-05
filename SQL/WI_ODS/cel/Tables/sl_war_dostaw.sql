CREATE TABLE [cel].[sl_war_dostaw] (
    [kod]  VARCHAR (10)   NOT NULL,
    [opis] NVARCHAR (250) NULL,
    CONSTRAINT [PK_sl_war_dostaw] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

