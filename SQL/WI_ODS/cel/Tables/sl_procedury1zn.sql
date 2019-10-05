CREATE TABLE [cel].[sl_procedury1zn] (
    [kod]  NVARCHAR (1)   NOT NULL,
    [opis] NVARCHAR (200) NULL,
    CONSTRAINT [PK_sl_procedury1zn] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

