CREATE TABLE [osoz].[pokwitowanie_seed] (
    [pokwitowanie_id] BIGINT NOT NULL,
    [seed_id]         BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([pokwitowanie_id] ASC, [seed_id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk44b2da292fa1094] FOREIGN KEY ([seed_id]) REFERENCES [osoz].[status_kontrahenta] ([id]),
    CONSTRAINT [fk44b2da29cac4ee22] FOREIGN KEY ([pokwitowanie_id]) REFERENCES [osoz].[pokwitowania] ([id])
);

