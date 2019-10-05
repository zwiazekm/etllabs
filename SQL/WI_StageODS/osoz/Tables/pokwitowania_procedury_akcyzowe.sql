CREATE TABLE [osoz].[pokwitowania_procedury_akcyzowe] (
    [pokwitowanie_id]       BIGINT NOT NULL,
    [procedura_akcyzowa_id] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([pokwitowanie_id] ASC, [procedura_akcyzowa_id] ASC)
);

