CREATE TABLE [osoz].[zabezpieczenia_generalne_procedury] (
    [id]                BIGINT   NOT NULL,
    [czas_modyfikacji]  DATETIME NULL,
    [jednostka_id]      BIGINT   NOT NULL,
    [zabezpieczenie_id] BIGINT   NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk50a5653c12fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fk50a5653c870c9a52] FOREIGN KEY ([jednostka_id]) REFERENCES [osoz].[struktura_organizacyjna] ([id])
);

