CREATE TABLE [osoz].[zabezpieczenia_status_kontrahenta] (
    [zabezpieczenie_id]     BIGINT NOT NULL,
    [status_kontrahenta_id] BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([zabezpieczenie_id] ASC, [status_kontrahenta_id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fkb742054312fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fkb74205431970bf6d] FOREIGN KEY ([status_kontrahenta_id]) REFERENCES [osoz].[status_kontrahenta] ([id])
);

