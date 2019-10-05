CREATE TABLE [cel].[sl_wy_wartości] (
    [kod]  VARCHAR (50) NOT NULL,
    [opis] VARCHAR (50) NULL,
    CONSTRAINT [PK_sl_wy_wartości] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

