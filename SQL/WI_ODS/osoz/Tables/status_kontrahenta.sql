CREATE TABLE [osoz].[status_kontrahenta] (
    [id]               BIGINT       NOT NULL,
    [czas_modyfikacji] DATETIME     NULL,
    [seed]             VARCHAR (13) NOT NULL,
    [kontrahent_id]    BIGINT       NOT NULL,
    [nazwa_seed_id]    BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fkcc44be18e6a80402] FOREIGN KEY ([kontrahent_id]) REFERENCES [osoz].[kontrahenci] ([id]),
    CONSTRAINT [fkcc44be18fcbe109c] FOREIGN KEY ([nazwa_seed_id]) REFERENCES [osoz].[sl_nazwy_seed] ([id])
);

