CREATE TABLE [cel].[sl_dyrektywy] (
    [kod]  VARCHAR (10) NOT NULL,
    [opis] VARCHAR (80) NULL,
    CONSTRAINT [PK_sl_dyrektywy] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

