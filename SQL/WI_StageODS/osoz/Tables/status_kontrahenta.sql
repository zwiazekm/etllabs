CREATE TABLE [osoz].[status_kontrahenta] (
    [id]               BIGINT       NOT NULL,
    [czas_modyfikacji] DATETIME     NULL,
    [seed]             VARCHAR (13) NOT NULL,
    [kontrahent_id]    BIGINT       NOT NULL,
    [nazwa_seed_id]    BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

