CREATE TABLE [osoz].[zabezpieczenia_status_kontrahenta] (
    [zabezpieczenie_id]     BIGINT NOT NULL,
    [status_kontrahenta_id] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([zabezpieczenie_id] ASC, [status_kontrahenta_id] ASC)
);

