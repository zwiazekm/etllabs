CREATE TABLE [osoz].[zabezpieczenia_towary] (
    [id]                BIGINT   NOT NULL,
    [czas_modyfikacji]  DATETIME NULL,
    [wykluczony]        BIT      NOT NULL,
    [towar_id]          BIGINT   NOT NULL,
    [zabezpieczenie_id] BIGINT   NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk267f4f3712fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fk267f4f37a7d97dd2] FOREIGN KEY ([towar_id]) REFERENCES [osoz].[towary] ([id])
);

