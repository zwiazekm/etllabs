CREATE TABLE [cel].[sl_met_platn] (
    [kod]  CHAR (1)      NOT NULL,
    [opis] VARCHAR (255) NULL,
    CONSTRAINT [PK_sl_met_platn] PRIMARY KEY CLUSTERED ([kod] ASC) WITH (FILLFACTOR = 90)
);

