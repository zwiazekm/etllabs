CREATE TABLE [osoz].[pokwitowania_procedury_akcyzowe] (
    [pokwitowanie_id]       BIGINT NOT NULL,
    [procedura_akcyzowa_id] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([pokwitowanie_id] ASC, [procedura_akcyzowa_id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fkc8d06197a423fb11] FOREIGN KEY ([procedura_akcyzowa_id]) REFERENCES [osoz].[procedury_akcyzowe] ([id]),
    CONSTRAINT [fkc8d06197cac4ee22] FOREIGN KEY ([pokwitowanie_id]) REFERENCES [osoz].[pokwitowania] ([id])
);

