CREATE TABLE [cel].[sl_procedury4zn] (
    [kod]  VARCHAR (10)   NOT NULL,
    [opis] NVARCHAR (300) NULL,
    CONSTRAINT [PK_sl_procedury4zn] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

