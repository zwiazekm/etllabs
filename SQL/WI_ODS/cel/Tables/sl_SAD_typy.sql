CREATE TABLE [cel].[sl_SAD_typy] (
    [kod]  VARCHAR (5)  NOT NULL,
    [opis] VARCHAR (50) NULL,
    CONSTRAINT [PK_sl_SAD_typy] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

