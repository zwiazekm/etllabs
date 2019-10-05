CREATE TABLE [osoz].[decyzcje_zwolnienia_seed] (
    [decyzja_zwolnienia_id] BIGINT NOT NULL,
    [seed_id]               BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([decyzja_zwolnienia_id] ASC, [seed_id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk77d79e162fa1094] FOREIGN KEY ([seed_id]) REFERENCES [osoz].[status_kontrahenta] ([id]),
    CONSTRAINT [fk77d79e16a2ad9037] FOREIGN KEY ([decyzja_zwolnienia_id]) REFERENCES [osoz].[decyzje_w_sprawie_zwolnienia] ([id])
);

